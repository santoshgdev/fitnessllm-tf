resource "google_storage_bucket" "gcs-fitnessllm" {
  name = nonsensitive(local.dev_infra.dev.bronze_bucket)
  location = "US"
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  labels = {
    environment = "dev"
    project = "fitnessllm"
  }

}

resource "google_bigquery_dataset" "dev_strava" {
  dataset_id = "dev_strava"
  friendly_name = "dev_strava"
  description = "BQ dataset for Strava"
  location = "US"

  labels = {
    environment = "dev"
    project = "fitnessllm"
  }

}


resource "google_bigquery_table" "dev_strava_activity" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "activity"
  description = "Strava ActivitySummary"
  schema     = file("${path.module}/bq-schemas/activity.json")

  labels = {
    environment = "dev"
    project = "fitnessllm"
  }
}