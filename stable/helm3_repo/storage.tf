resource "google_storage_bucket" "helm_repo" {
  name          = "helm3.brodul.org"
  location      = "EU"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
resource "google_storage_bucket_iam_binding" "public_rule" {
  bucket = google_storage_bucket.helm_repo.name
  role = "roles/storage.objectViewer"
  members = [
    "allUsers"
  ]
}
