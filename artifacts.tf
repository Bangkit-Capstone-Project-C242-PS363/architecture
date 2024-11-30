resource "google_artifact_registry_repository" "backend" {
  location      = var.region
  repository_id = "backend"
  description   = "Docker repository for backend services"
  format        = "DOCKER"
}
resource "google_artifact_registry_repository_iam_member" "user_writer" {
  location   = google_artifact_registry_repository.backend.location
  repository = google_artifact_registry_repository.backend.name
  role       = "roles/artifactregistry.writer"
  member     = "user:c008b4ky1542@bangkit.academy"
}
