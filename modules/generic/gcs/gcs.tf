resource "google_storage_bucket" "gcs-fitnessllm-storage-generic" {
  name                        = "fitnessllm-storage-generic"
  location                    = var.location
  force_destroy               = true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true

  labels = {
    environment = var.environment
    project     = var.project
  }

}
