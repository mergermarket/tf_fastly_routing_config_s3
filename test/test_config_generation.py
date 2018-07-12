import unittest
import os
import re
import json
from subprocess import check_call, check_output

cwd = os.getcwd()


def optional_whitespace(pattern):
    '''
    Replaces whitespace in the provided pattern with a pattern that matches
    optional whitespace.
    '''
    return re.sub(r'[ \n]+', r'[ \n]*', pattern)


class TestConfigGeneration(unittest.TestCase):

    def setUp(self):
        check_call(['terraform', 'init', 'test/infra'])
        check_call(['terraform', 'get', 'test/infra'])
        self.output = check_output([
            'terraform', 'apply',
            '-var', 'defaults_vcl_recv_condition=test-cond',
            '-var', 'defaults_backend_name=test-backend',
            '-var', 'defaults_s3_bucket_name=test-bucket',
            '-var', 'defaults_aws_access_key_id=JKCAUEFV2ONFFOFMSSLA',
            '-var', 'defaults_aws_secret_access_key=P2WPSu68Bfl89j72vT+bXYZB7SjlOwhT4whqt27',
            'test/infra'
        ]).decode('utf-8')

    def test_vcl_recv(self):
        self.assertRegexpMatches(
            self.output,
            re.compile(optional_whitespace(r'''
                defaults_vcl_recv =
                if \( req.backend == F_default_backend && \( test-cond \) \) \{
                    set req\.backend \= test-backend\;
                    set req\.http\.Date \= now\;
                    set req\.http\.host \= "test-bucket\.s3\.amazonaws\.com"\;
                    set req\.http\.Authorization \= "AWS JKCAUEFV2ONFFOFMSSLA\:" digest\.hmac_sha1_base64\("P2WPSu68Bfl89j72vT\+bXYZB7SjlOwhT4whqt27", if\(req\.request \=\= "HEAD", "GET", req\.request\) LF LF LF req\.http\.Date LF "\/test-bucket" req\.url\.path\)\;
                \}
            '''), re.X)
        )
