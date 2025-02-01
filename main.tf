#These variables are set via TF_VAR_* environmental variables
variable "credentials_path" {} # PATH TO CREDENTIALS PATH
variable "project" {} # PROJECT_NAME

provider "google" {
  credentials = file("${var.credentials_path}")
  project = "${var.project}"
  region = "us-west1"
  zone = "us-west1-a"
}

terraform {
  backend "gcs" {
    bucket  = "sg-terraform-state"
    prefix = "fitnessllm/state"
  }
}