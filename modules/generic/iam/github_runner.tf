resource "google_service_account" "github_actions" {
  account_id   = "github-actions-sa"
  display_name = "GitHub Actions Service Account"
  description  = "Service account for GitHub Actions to push Docker images to GCR"
}

resource "google_project_iam_member" "service_account_token_creator" {
  project = var.project
  role    = "roles/iam.serviceAccountTokenCreator" # Required for createOnPush
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "service_account_user" {
  project = var.project
  role    = "roles/iam.serviceAccountUser" # Required for createOnPush
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "cloud_builder" {
  project = var.project
  role    = "roles/cloudbuild.builds.builder" # Required for createOnPush
  member  = "serviceAccount:${google_service_account.github_actions.email}"
}

resource "google_project_iam_member" "cloud_function_developer" {
  project = var.project
  role    = "roles/cloudfunctions.developer" # Required for createOnPush
  member  = "serviceAccount:${google_service_account.github_actions.email}"
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
