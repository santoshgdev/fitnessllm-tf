resource "google_service_account" "github_actions" {
  account_id   = "github-actions-sa"
  display_name = "GitHub Actions Service Account"
  description  = "Service account for GitHub Actions to push Docker images to GCR"
}

resource "google_project_iam_member" "artifact_registry_create" {
  project = var.project
  role    = "roles/artifactregistry.repoAdmin" # Required for createOnPush
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

# Existing write permissions (keep this)
resource "google_project_iam_member" "artifact_registry_writer" {
  project = var.project
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}
