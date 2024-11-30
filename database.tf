resource "google_sql_database_instance" "main" {
  name             = "main"
  database_version = "POSTGRES_15"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled = true

      authorized_networks {
        name  = "allow-all"
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = true
}


resource "google_sql_database" "database" {
  name     = var.db_database
  instance = google_sql_database_instance.main.name
}

resource "google_sql_user" "users" {
  name     = var.db_username
  instance = google_sql_database_instance.main.name
  password = var.db_password
}
