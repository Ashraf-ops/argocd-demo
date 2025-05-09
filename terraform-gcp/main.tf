resource "google_storage_bucket" "gcp_backend_bucket" {
  name          = "rajagjghsjsk"
  project       = "tonal-edge-458514-a3"
  location      = "ASIA"
  force_destroy = true
  storage_class = "STANDARD"
  versioning {
    enabled = false
  }
}