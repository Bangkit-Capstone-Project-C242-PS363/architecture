variable "bucket_model" {
  description = "The name of the bucket to store the dataset"
  type        = string
  default     = "bucket-asl-model"
}

variable "bucket_data" {
  description = "The name of the bucket to store the dataset"
  type        = string
  default     = "bucket-asl-data"
}

variable "ml_dev_emails" {
  description = "List of email addresses to grant bucket access"
  type        = list(string)
  default     = []
}

resource "google_storage_bucket" "bucket_asl_model" {
  name          = var.bucket_model
  force_destroy = false # Prevent accidental deletion of the bucket
  location      = var.region

  lifecycle_rule {
    condition {
      age = 360
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket" "bucket_asl_data" {
  name          = var.bucket_data
  force_destroy = false # Prevent accidental deletion of the bucket
  location      = var.region
}

resource "google_storage_bucket_iam_member" "model_bucket_admin" {
  for_each = toset(var.ml_dev_emails)

  bucket = google_storage_bucket.bucket_asl_model.name
  role   = "roles/storage.admin"
  member = "user:${each.value}"
}
