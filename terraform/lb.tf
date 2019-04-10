resource "google_compute_target_pool" "reddit-app" {
  name = "reddit-app"

  instances = [
    "${google_compute_instance.app.*.self_link}",
  ]

  health_checks = [
    "${google_compute_http_health_check.reddit-check.name}",
  ]
}

resource "google_compute_forwarding_rule" "default" {
  name       = "reddit-forward"
  target     = "${google_compute_target_pool.reddit-app.self_link}"
  port_range = "9292"
}

resource "google_compute_http_health_check" "reddit-check" {
  name               = "reddit-check"
  port               = "9292"
  timeout_sec        = 5
  check_interval_sec = 5
}
