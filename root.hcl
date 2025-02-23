# root.hcl (corrected)
locals {
  project       = coalesce(get_env("TF_VAR_project", ""), "default-project") # Fallback value
  location      = "us-west1"
  code          = get_env("TF_VAR_code")
  region        = "us-west1"
  schema_folder = "${get_env("TF_VAR_code")}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas"
}

remote_state {
  backend = "gcs"
  config = {
    bucket = "sg-terraform-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "provider" {
  path      = "_provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
  provider "google" {
    project = "${local.project}"
    region  = "us-west1"
  }
  EOF
}
