variable "credentials_path" {}

provider "google" {
  credentials = file("${var.credentials_path}")
  project = "stable-splicer-447620-b4"
  region = "us-west1"
  zone = "us-west1-a"
}

terraform {
  backend "gcs" {
    bucket  = "sg-terraform-state"
    prefix = "fitnessllm/state"
  }
}