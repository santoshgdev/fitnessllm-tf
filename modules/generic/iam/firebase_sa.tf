resource "google_service_account" "firebase_sa" {
  account_id   = "firebase-sa"
  display_name = "Firebase Service Account"
}

# Adding fine grained permissions
resource "google_project_iam_custom_role" "firebase_custom_role" {
  role_id     = "firebase_role"
  title       = "Firebase Custom Role"
  project     = var.project
  description = "A custom role with fine-grained permissions for the firebase service account."

  permissions = ["firebase.projects.get",
                 "firebase.projects.update",
                 "firebaseauth.configs.create",
                 "firebaseauth.configs.get",
                 "firebaseauth.configs.update",
                 "firebaseauth.users.create",
                 "firebaseauth.users.createSession",
                 "iam.serviceAccounts.get",
                 "iam.serviceAccounts.list",
                 "iam.serviceAccounts.getIamPolicy",
                 "iam.serviceAccounts.setIamPolicy",
                 "serviceusage.services.use"]
}

# Attach the custom IAM role with fine-grained permissions to service account
resource "google_project_iam_member" "firebase_sa_custom_role" {
  project = var.project
  role    = google_project_iam_custom_role.firebase_custom_role.name
  member  = "serviceAccount:${google_service_account.firebase_sa.email}"
}
