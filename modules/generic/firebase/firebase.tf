resource "google_firebase_project" "firebase" {
  provider   = google-beta
  project    = var.project
}

resource "google_firebase_hosting_site" "dev" {
  provider = google-beta
  project  = var.project
  site_id  = "${var.project}-dev"
  depends_on = [google_firebase_project.firebase]
}


resource "google_firebase_hosting_site" "prod" {
  provider = google-beta
  project  = var.project
  site_id  = "${var.project}-prod"
  depends_on = [google_firebase_project.firebase]
}