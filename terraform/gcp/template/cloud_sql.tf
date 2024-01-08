# Create a Cloud SQL instance
resource "google_sql_database_instance" "vectice" {
  name             = var.sql_instance_id
  database_version = "POSTGRES_13"
  region           = var.region
  deletion_protection = false
  depends_on = [google_service_networking_connection.vectice]
  settings {
    tier = "db-custom-2-7680"

    disk_type       = "PD_SSD"
    disk_size       = 92
    disk_autoresize = true

    backup_configuration {
      enabled    = true
      start_time = var.backup_start_time

      point_in_time_recovery_enabled = true
    }

    availability_type = var.availability_type
    

    ip_configuration {
      ipv4_enabled    = var.ipv4_enablement
      private_network = "projects/${var.project_id}/global/networks/${var.network}"
      require_ssl = true
    }
  }
}
#creating dedicated user
resource "google_sql_user" "vectice" {
  name     = var.db_username
  instance = google_sql_database_instance.vectice.name
  password = var.db_password
}

# Create two databases on the instance
resource "google_sql_database" "vectice_db" {
  name   = var.vectice_db_name
  instance = google_sql_database_instance.vectice.name
}

resource "google_sql_database" "keycloak_db" {
  name   = var.keycloak_db_name
  instance = google_sql_database_instance.vectice.name
}

#create a certificate to connect to instance

resource "google_sql_ssl_cert" "client_cert" {
  common_name = var.client_cert_name
  instance    = google_sql_database_instance.vectice.name
}

resource "local_file" "vectice_sql_client_cert" {
  content  = google_sql_ssl_cert.client_cert.cert
  filename = "vectice_sql_client_cert.pem"
}

resource "local_file" "vectice_sql_client_key" {
  content  = google_sql_ssl_cert.client_cert.private_key
  filename = "vectice_sql_client_key.pem"
}

resource "local_file" "vectice_sql_client_ca" {
  content  = google_sql_ssl_cert.client_cert.server_ca_cert
  filename = "vectice_sql_client_ca.pem"
}
