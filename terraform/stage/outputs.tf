output "app_external_ip" {
  #  value = "${google_compute_instance.app.*.network_interface.0.access_config.0.nat_ip}"
  value = "${module.app.app_external_ip}"
}

#output "app_frontend_ip" {
#  value = "${google_compute_forwarding_rule.default.ip_address}"
#}

