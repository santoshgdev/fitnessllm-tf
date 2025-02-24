resource "google_service_account" "llm_sa" {
  account_id   = "llm-sa"
  display_name = "AI Service Account"
}

# Adding fine grained permissions
resource "google_project_iam_custom_role" "llm_custom_role" {
  role_id     = "llm_role"
  title       = "LLM Custom Role"
  project     = var.project
  description = "A custom role with fine-grained permissions for the LLM service account."

  permissions = [
    "bigquery.tables.list",
    "bigquery.tables.get",
    "bigquery.jobs.create"
  ]
}

# Attach the custom IAM role with fine-grained permissions to service account
resource "google_project_iam_member" "ai_sa_custom_role" {
  project = var.project
  role    = google_project_iam_custom_role.llm_custom_role.name
  member  = "serviceAccount:${google_service_account.llm_sa.email}"
}