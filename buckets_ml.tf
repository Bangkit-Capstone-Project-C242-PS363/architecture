variable "bucket_dataset" {
  description = "The name of the bucket to store the dataset"
  type        = string
  default     = "bucket-asl-dataset"
}

variable "bucket_model" {
  description = "The name of the bucket to store the dataset"
  type        = string
  default     = "bucket-asl-model"
}

# To create a new bucket
resource "google_storage_bucket" "bucket_asl_dataset" {
  name          = var.bucket_dataset
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
