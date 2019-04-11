terraform {
  # Версия terraform  
  # required_version = "0.11.11"
  required_version = ">=0.11,<0.12"

  backend "gcs" {
    bucket = "storage-bucket-stage-1"
    prefix = "prod"
  }
}
