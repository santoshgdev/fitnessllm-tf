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


resource "google_bigquery_dataset" "dev_metrics" {
  dataset_id = "dev_metrics"
  friendly_name = "dev_metrics"
  description = "BQ dataset for Dev Metrics"
  location = "US"

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
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_activity" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "activity"
  description = "Strava Activity Summary"
  schema     = file("${path.module}/bq-schemas/activity.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_cadence_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "cadence_stream"
  description = "Strava Cadence Stream"
  schema     = file("${path.module}/bq-schemas/cadence_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_distance_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "distance_stream"
  description = "Strava Distance Stream"
  schema     = file("${path.module}/bq-schemas/distance_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}

resource "google_bigquery_table" "dev_strava_heartrate_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "heartrate_stream"
  description = "Strava Heartrate Stream"
  schema     = file("${path.module}/bq-schemas/heartrate_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_latlng_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "latlng_stream"
  description = "Strava Heartrate Stream"
  schema     = file("${path.module}/bq-schemas/latlng_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_power_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "power_stream"
  description = "Strava Power Stream"
  schema     = file("${path.module}/bq-schemas/power_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_smoothgrade_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "smoothgrade_stream"
  description = "Strava SmoothGrade Stream"
  schema     = file("${path.module}/bq-schemas/smoothgrade_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_smoothvelocity_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "smoothvelocity_stream"
  description = "Strava SmoothVelocity Stream"
  schema     = file("${path.module}/bq-schemas/smoothvelocity_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_strava_temp_stream" {
  dataset_id = google_bigquery_dataset.dev_strava.dataset_id
  table_id   = "temp_stream"
  description = "Strava Temp Stream"
  schema     = file("${path.module}/bq-schemas/temp_stream.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
    stream = "strava"
  }
}


resource "google_bigquery_table" "dev_metrics" {
  dataset_id = google_bigquery_dataset.dev_metrics.dataset_id
  table_id   = "metrics"
  description = "FitnessLLM Metrics"
  schema     = file("${path.module}/bq-schemas/metrics.json")
  deletion_protection = false

  labels = {
    environment = "dev"
    project = "fitnessllm"
  }
}






