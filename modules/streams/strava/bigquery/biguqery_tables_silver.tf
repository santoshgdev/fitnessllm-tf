resource "google_bigquery_table" "strava_aggregate_stream" {
  dataset_id          = google_bigquery_dataset.silver_strava.dataset_id
  table_id            = "aggregate_stream"
  description         = "Strava Aggregate Stream"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/stream/strava/schemas/silver/json/aggregate_stream.json")
  deletion_protection = var.environment == "dev" ? false : true
  clustering          = ["athlete_id", "activity_id"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "index"] # Composite primary key
    }
    foreign_keys {
      name = "fk_athlete_summary_athlete_id"
      referenced_table {
        project_id = var.project
        dataset_id = google_bigquery_dataset.bronze_strava.dataset_id
        table_id   = google_bigquery_table.strava_activity.table_id
      }
      column_references {
        referenced_column  = "athlete_id"
        referencing_column = "athlete_id"
      }
    }
    foreign_keys {
      name = "fk_activity_summary_athlete_id"
      referenced_table {
        project_id = var.project
        dataset_id = google_bigquery_dataset.bronze_strava.dataset_id
        table_id   = google_bigquery_table.strava_athlete_summary.table_id
      }
      column_references {
        referenced_column  = "athlete_id"
        referencing_column = "athlete_id"
      }
    }
    foreign_keys {
      name = "fk_activity_summary_activity_id"
      referenced_table {
        project_id = var.project
        dataset_id = google_bigquery_dataset.bronze_strava.dataset_id
        table_id   = google_bigquery_table.strava_activity.table_id
      }
      column_references {
        referenced_column  = "activity_id"
        referencing_column = "activity_id"
      }
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
    layer       = "silver"
    stream      = "strava"
  }
}
