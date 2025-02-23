resource "google_bigquery_dataset" "metrics" {
  dataset_id    = "${var.environment}_metrics"
  friendly_name = "${var.environment}_metrics"
  description   = "BQ dataset for ${var.environment} Metrics"
  location      = "US"

  labels = {
    environment = var.environment
    project     = var.project
  }
}
