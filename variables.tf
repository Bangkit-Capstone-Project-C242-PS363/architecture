variable "project_name" {
  description = "The name of the GCP project"
  type        = string
  default     = "capstone-project-c242-ps363"
}

variable "region" {
  description = "The region to create the project in"
  default     = "asia-southeast2"
  type        = string
}
