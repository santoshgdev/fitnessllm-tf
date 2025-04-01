resource "google_cloudfunctions2_function" "tokenrefresh" {
  name        = "${var.environment}-tokenrefresh"
  location    = "us-west1"
  description = "Token refresh function"

  build_config {
    runtime     = "python39"
    entry_point = "refresh_token"
    source {
      storage_source {
        bucket = var.gcs-fitnessllm-storage-cf
        object = "${var.environment}/tokenrefresh/tokenrefresh.zip"
      }
    }
  }

  service_config {
    max_instance_count = 10
    min_instance_count = 0
    available_memory   = "256M"
    timeout_seconds    = 60

    environment_variables = {
      ENVIRONMENT       = var.environment
      PROJECT           = var.project
      ENCRYPTION_SECRET = var.ENCRYPTION_SECRET
      STRAVA_SECRET     = var.STRAVA_SECRET
    }
  }
}

