resource "google_storage_bucket" "gcs-fitnessllm" {
  name = nonsensitive(local.dev_infra.bronze_bucket)
  location = "US"
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  labels = {
    environment = "dev"
    project = "fitnessllm"
  }

}