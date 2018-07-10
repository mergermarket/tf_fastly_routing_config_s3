
# defaults

variable "defaults_vcl_recv_condition" {}
variable "defaults_backend_name" {}
variable "defaults_backend_host" {}
variable "defaults_s3_bucket_name" {}
variable "defaults_aws_access_key_id" {}
variable "defaults_aws_secret_access_key" {}

module "defaults" {
  source = "../.."
  vcl_recv_condition = "${var.defaults_vcl_recv_condition}"
  backend_name = "${var.defaults_backend_name}"
  backend_host = "${var.defaults_backend_host}"
  s3_bucket_name = "${var.defaults_s3_bucket_name}"
  aws_access_key_id = "${var.defaults_aws_access_key_id}"
  aws_secret_access_key = "${var.defaults_aws_secret_access_key}"
}

output "defaults_vcl_recv" {
  value = "${module.defaults.vcl_recv}"
}

output "defaults_vcl_backend" {
  value = "${module.defaults.vcl_backend}"
}

# ssl_ca_cert

variable "ssl_ca_cert" {}

module "ssl_ca_cert" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_ca_cert  = "${var.ssl_ca_cert}"
  s3_bucket_name = "dummy-bucket"
  aws_access_key_id = "JKCAUEFV2ONFFOFMSSLA"
  aws_secret_access_key = "P2WPSu68Bfl89j72vT+bXYZB7SjlOwhT4whqt27"
}

output "ssl_ca_cert_vcl_backend" {
  value = "${module.ssl_ca_cert.vcl_backend}"
}

# ssl_check_cert never

variable "ssl_check_cert" {}

module "ssl_check_cert" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_check_cert  = "${var.ssl_check_cert}"
  s3_bucket_name = "dummy-bucket"
  aws_access_key_id = "JKCAUEFV2ONFFOFMSSLA"
  aws_secret_access_key = "P2WPSu68Bfl89j72vT+bXYZB7SjlOwhT4whqt27"
}

output "ssl_check_cert_vcl_backend" {
  value = "${module.ssl_check_cert.vcl_backend}"
}

# ssl_sni_hostname

variable "ssl_sni_hostname" {}

module "ssl_sni_hostname" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_sni_hostname  = "${var.ssl_sni_hostname}"
  s3_bucket_name = "dummy-bucket"
  aws_access_key_id = "JKCAUEFV2ONFFOFMSSLA"
  aws_secret_access_key = "P2WPSu68Bfl89j72vT+bXYZB7SjlOwhT4whqt27"
}

output "ssl_sni_hostname_vcl_backend" {
  value = "${module.ssl_sni_hostname.vcl_backend}"
}
