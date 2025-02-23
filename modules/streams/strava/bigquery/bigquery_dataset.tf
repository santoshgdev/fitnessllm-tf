resource "google_bigquery_dataset" "bronze_strava" {
  dataset_id    = "${var.environment}_bronze_strava"
  friendly_name = "${var.environment}_bronze_strava"
  description   = "BQ dataset for Strava"
  location      = "US"

  delete_contents_on_destroy = var.environment == "dev" ? true : false

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "bronze"
    stream      = "strava"
  }
}

resource "google_bigquery_dataset" "silver_strava" {
  dataset_id    = "${var.environment}_silver_strava"
  friendly_name = "${var.environment}_silver_strava"
  description   = "BQ dataset for Strava"
  location      = "US"

  delete_contents_on_destroy = var.environment == "dev" ? true : false

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "silver"
    stream      = "strava"
  }
}
