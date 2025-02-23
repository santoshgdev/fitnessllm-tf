locals {
  view_files = [
    "view_activity_summary",
    "view_aggregate_stream",
  "view_athlete_summary"]
}


output "view_files" {
  value = local.view_files
}


resource "google_bigquery_table" "view" {
  for_each = toset(local.view_files)

  dataset_id = google_bigquery_dataset.silver_strava.dataset_id
  table_id   = trimsuffix(each.key, ".sql")

  view {
    query = templatefile("${var.schema_folder}/views/${each.key}.sql",
      {
        project = var.project
        schema  = google_bigquery_dataset.bronze_strava.dataset_id
    })
    use_legacy_sql = false
  }
}

# Output the view IDs and names
output "view_ids" {
  value = [for v in google_bigquery_table.view : v.table_id]
}

output "view_names" {
  value = [for v in google_bigquery_table.view : v.table_id]
}
