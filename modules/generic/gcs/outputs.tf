output "gcs-fitnessllm-storage-cf" {
  value       = google_storage_bucket.gcs-fitnessllm-storage-cf.name
  description = "Name of the Cloud Functions storage bucket"
} 