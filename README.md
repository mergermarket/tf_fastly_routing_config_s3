# tf\_fastly\_routing\_config\_s3 terraform module

[![Build Status](https://travis-ci.org/mergermarket/tf_fastly_routing_config_s3.svg?branch=master)](https://travis-ci.org/mergermarket/tf_fastly_routing_config_s3)

This module is for generating Fastly routing config using a AWS S3 private bucket
(see https://docs.fastly.com/guides/integrations/amazon-s3.html#setting-up-fastly-to-use-an-amazon-s3-private-bucket)
for inclusion in a custom VCL file. This is mainly useful for use building up the
`custom_vcl_backends` and `custom_vcl_recv` parameters to
[tf\_fastly\_frontend](https://github.com/mergermarket/tf_fastly_frontend)
(these allow for a variable number of backends to be supplied via a parameter -
something that isn't currently possible in ordinary terraform).

## Interface

To see all the input variables and outputs see `variables.tf` and `outputs.tf`.
The required input variables are:

* `vcl_recv_condition` - when to route to the backend as a VCL condition (see
https://docs.fastly.com/guides/conditions/using-conditions).
* `backend_name` - the name of the backend (must be unique across backends).
* `backend_host` - the host to connect to (https default port 443).
* `s3_bucket_name` - the name of the S3 bucket.
* `aws_access_key_id` - AWS_ACCESS_KEY_ID required to access the bucket.
* `aws_secret_access_key` - AWS_SECRET_ACCESS_KEY required to access the bucket.

The outputs are:

* `vcl_recv` - fragment of VCL to add to `custom_vcl_recv`.
* `vcl_backend` - fragment of VCL to add to custom\_vcl\_backends`.
