resource "google_cloudfunctions_function" "krsko-prometheus" {
  name    = "krsko-prometheus"
  runtime = "python37"

  labels = {
    "deployment-tool" = "console-cloud"
  }


  available_memory_mb = 128
  trigger_http        = true
  entry_point         = "main"
  max_instances       = 1
  timeout             = 5
}

# IAM entry for all users to invoke the function
resource "google_cloudfunctions_function_iam_member" "krsko-prometheus-invoker" {
  project        = google_cloudfunctions_function.krsko-prometheus.project
  region         = google_cloudfunctions_function.krsko-prometheus.region
  cloud_function = google_cloudfunctions_function.krsko-prometheus.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
