variable project {
  description = "Project ID"
}

variable region {
  description = "Region"

  # Значение по умолчанию  
  default = "europe-west1"
}

variable public_key_path {
  # Описание переменной  
  description = "Path to the public key used for ssh access"
}

variable disk_image {
  description = "Disk image"
}

variable zone {
  description = "Zone of instanse"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable public_key_path_appuser1 {
	description = "Path to the public key used for appuser1 ssh access"
}

variable public_key_path_appuser2 {
        description = "Path to the public key used for appuser2 ssh access"
}

variable public_key_path_appuser3 {
        description = "Path to the public key used for appuser3 ssh access"
}

