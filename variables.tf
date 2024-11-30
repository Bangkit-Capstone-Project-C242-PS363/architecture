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

variable "db_username" {
  description = "admin"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "db_database" {
  description = "Database name"
  type        = string
  sensitive   = true
}
