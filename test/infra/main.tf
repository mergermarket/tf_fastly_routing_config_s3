
# defaults

variable "defaults_vcl_recv_condition" {}
variable "defaults_backend_name" {}
variable "defaults_s3_bucket_name" {}
variable "defaults_aws_access_key_id" {}
variable "defaults_aws_secret_access_key" {}

module "defaults" {
  source = "../.."
  vcl_recv_condition = "${var.defaults_vcl_recv_condition}"
  backend_name = "${var.defaults_backend_name}"
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
