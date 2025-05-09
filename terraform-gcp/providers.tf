provider "google" {
  project = "tonal-edge-458514-a3"
  region  = "asia-south1"
  credentials = file(var.credentials_file)
}