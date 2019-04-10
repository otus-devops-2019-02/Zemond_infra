terraform {
  # Версия terraform  
  required_version = "0.11.11"
}

provider "google" {
  # Версияпровайдера  
  version = "2.0.0"

  # ID проекта  
  project = "${var.project}"

  region = "${var.region}"
}

resource "google_compute_instance" "app" {
  name         = "reddit-app${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-app"]
  count        = "${var.count}"

  metadata {
    # путь до публичного ключа    
    ssh-keys = "pankratov:${file(var.public_key_path)}"
  }

  # определение загрузочного диска  
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  # определение сетевого интерфейса  
  network_interface {
    # сеть, к которой присоединить данный интерфейс    
    network = "default"

    # использовать ephemeral IP для доступа из Интернет    
    access_config {}
  }

  connection {
    type  = "ssh"
    user  = "pankratov"
    agent = false

    # путь до приватного ключа  
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Название сети, в которой действует правило  
  network = "default"

  # Какой доступ разрешить  
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Каким адресам разрешаем доступ  
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с перечисленными тэгами  
  target_tags = ["reddit-app"]
}

#resource "google_compute_project_metadata" "default" {
#  metadata {
#    ssh_keys = "appuser1:${file(var.public_key_path_appuser1)}"
#  }
#}

resource "google_compute_project_metadata" "default" {
  metadata {
    ssh_keys = "appuser1:${file(var.public_key_path_appuser1)}\nappuser2:${file(var.public_key_path_appuser2)}\nappuser3:${file(var.public_key_path_appuser3)}"
  }
}
