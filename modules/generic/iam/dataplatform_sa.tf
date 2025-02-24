resource "google_service_account" "dataplatform_sa" {
  account_id   = "dataplatform-sa"
  display_name = "Dataplatform Service Account"
}

# Adding fine grained permissions
resource "google_project_iam_custom_role" "dataplatform_custom_role" {
  role_id     = "dataplatform_role"
  title       = "Dataplatform Custom Role"
  project     = var.project
  description = "A custom role with fine-grained permissions for the dataplatform service account."

  permissions = [
    "secretmanager.secrets.get",
    "secretmanager.versions.access",
    "storage.objects.get",
    "storage.objects.list",
    "storage.objects.create",
    "storage.objects.delete",
    "bigquery.jobs.create",
    "bigquery.tables.getData",
    "bigquery.tables.get",
    "bigquery.tables.updateData",
    "bigquery.tables.create",
    "bigquery.readsessions.create",
    "bigquery.readsessions.getData"
  ]
}

# Attach the custom IAM role with fine-grained permissions to service account
resource "google_project_iam_member" "dataplatform_sa_custom_role" {
  project = var.project
  role    = google_project_iam_custom_role.dataplatform_custom_role.name
  member  = "serviceAccount:${google_service_account.dataplatform_sa.email}"
}






# # Attach a list of pre-existing roles to the service account
# variable "roles" {
#   type    = list(string)
#   default = [
#     "roles/secretmanager.secretAccessor"
#   ]
# }
# resource "google_project_iam_member" "dataplatform_sa_roles" {
#   for_each = toset(var.roles)
#
#   project = var.project
#   role    = each.value
#   member  = "serviceAccount:${google_service_account.dataplatform_sa.email}"
# }
