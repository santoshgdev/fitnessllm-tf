data "google_secret_manager_secret_version" "fitnessllm_dev_infrastructure_names" {
  secret = "projects/413377316902/secrets/fitnessllm_dev_infrastructure_names"
}

locals {
  dev_infra = jsondecode(data.google_secret_manager_secret_version.fitnessllm_dev_infrastructure_names.secret_data)
}
