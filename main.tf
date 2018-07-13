locals {
  backend_host = "s3.${var.region}.amazonaws.com"
  host_header = "${var.s3_bucket_name}.s3.amazonaws.com"
}

data "template_file" "vcl_recv" {
  template = <<END
        if (req.backend == F_default_backend && ($${vcl_recv_condition})) {
            set req.backend = $${backend_name};
            set req.http.Date = now;
            set req.http.host = "$${host_header}";
            set req.http.Authorization = "AWS $${aws_access_key_id}:" digest.hmac_sha1_base64("$${aws_secret_access_key}", if(req.request == "HEAD", "GET", req.request) LF LF LF req.http.Date LF "/$${s3_bucket_name}" req.url.path);
        }
END

  vars {
    vcl_recv_condition    = "${var.vcl_recv_condition}"
    backend_name          = "${var.backend_name}"
    host_header           = "${local.host_header}"
    aws_access_key_id     = "${var.aws_access_key_id}"
    aws_secret_access_key = "${var.aws_secret_access_key}"
    s3_bucket_name        = "${var.s3_bucket_name}"
  }
}

module "acuris_apps_config_vcl_backend" {
  source = "github.com/mergermarket/tf_fastly_routing_config_vcl_backend"

  backend_name = "${var.backend_name}"
  backend_host = "${local.backend_host}"
}
