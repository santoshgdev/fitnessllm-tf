resource "google_service_account" "dev-dataplatform-sa" {
  account_id   = "dev-dataplatform-sa"
  project      = var.project
  display_name = "Terraform Managed Service Account for DataPlatform"
}

resource "google_project_iam_member" "bigquery" {
  project = var.project

  for_each = toset([
    "roles/bigquery.dataEditor",
    "roles/bigquery.jobUser",
    "roles/bigquery.readSessionUser",
    "roles/storage.objectAdmin",
    "roles/secretmanager.secretAccessor",
  ])

  role   = each.value
  member = "serviceAccount:${google_service_account.dev-dataplatform-sa.email}"

  depends_on = [google_service_account.dev-dataplatform-sa]
}
