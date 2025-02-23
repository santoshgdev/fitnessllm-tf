resource "google_artifact_registry_repository" "custom_repo" {
  repository_id = "fitnessllm-dp"
  location      = var.region
  format        = "DOCKER"
}
