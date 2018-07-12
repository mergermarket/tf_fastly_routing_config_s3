output "vcl_recv" {
  value = "${data.template_file.vcl_recv.rendered}"
}

output "vcl_backend" {
  value = "${module.acuris_apps_config_vcl_backend.vcl_backend}"
}
