# environments/dev/terragrunt.hcl
include "root" {
  path = find_in_parent_folders("root.hcl")
}

remote_state {
  backend = "gcs"
  config = {
    bucket = "sg-terraform-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

locals {
  infra_config = jsondecode(run_cmd("gcloud", "secrets", "versions", "access", "latest", "--secret=infrastructure"))
}


generate "combined_modules" {
  path      = "_main.tf"
  if_exists = "overwrite"
  contents  = <<EOF
    terraform {
      backend "gcs" {}
    }

    module "generic_bigquery" {
      source = "${get_parent_terragrunt_dir()}//modules/generic/bigquery"
      environment = var.environment
      project     = var.project
      code = var.code
    }

    module "generic_iam" {
      source = "${get_parent_terragrunt_dir()}//modules/generic/iam"
      project = var.project
    }

    module "generic_containerization" {
      source = "${get_parent_terragrunt_dir()}//modules/generic/containerization"
      region = var.region
    }

    module "generic_gcs" {
      source = "${get_parent_terragrunt_dir()}//modules/generic/gcs"
      location = var.location
      environment = var.environment
      project = var.project
    }

    module "strava_bigquery" {
      source = "${get_parent_terragrunt_dir()}//modules/streams/strava/bigquery"
      environment = var.environment
      project     = var.project
      code = var.code
      schema_folder = var.schema_folder
    }

    module "strava_gcs" {
      source = "${get_parent_terragrunt_dir()}//modules/streams/strava/gcs"
      environment = var.environment
      project     = var.project
      location = var.location
      bucket_name = var.bucket_name
    }

    variable "bucket_name" {}
    variable "location" {}
    variable "schema_folder" {}
    variable "region" {}
    variable "code" {}
    variable "project" {}
    variable "environment" {}
EOF
}



inputs = {
  bucket_name   = local.infra_config.dev.bronze_bucket
  schema_folder = "${get_env("TF_VAR_code")}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas"
  region        = "us-west1"
  environment   = "dev"
  project       = coalesce(get_env("TF_VAR_project", ""), "default-project")
  location      = "us-west1"
}
