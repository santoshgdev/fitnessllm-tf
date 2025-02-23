resource "google_bigquery_table" "metrics" {
  dataset_id          = google_bigquery_dataset.metrics.dataset_id
  table_id            = "metrics"
  description         = "FitnessLLM Metrics"
  schema              = file("${var.code}/fitnessllm-dataplatform/fitnessllm_dataplatform/schemas/metrics.json")
  deletion_protection = false
  clustering          = ["athlete_id", "activity_id", "data_source", "data_stream"]
  table_constraints {
    primary_key {
      columns = ["athlete_id", "activity_id", "data_source", "data_stream"] # Composite primary key
    }
  }

  labels = {
    environment = var.environment
    project     = var.project
  }
}
