output "SQL_instance_internal_IP_address" {
  value = google_sql_database_instance.vectice.private_ip_address
  description = "global.database.host"
}

output "SQL_instance_internal_IP_address" {
  value = var.db_username
  description = "global.database.username"
}

output "SQL_instance_internal_IP_address" {
  value = var.db_password
  description = "global.database.password"
}

output "SQL_instance_service_account" {
  value = google_sql_database_instance.vectice.service_account_email_address
  description = "service_account_sql_instance"
}
output "Bucket_name" {
  value = google_storage_bucket.vectice_project.name
  description = "Bucket name"
}

output "SQL_instance_name" {
  value = google_sql_database_instance.vectice.name
  description = "SQL_instance_instance_name"
}
output "SQL_cert_name" {
  value = var.client_cert_name
  description = "SQL_instance_cert_name"
}


output "SQL_instance_region" {
  value = google_sql_database_instance.vectice.region
  description = "SQL instance region"
}


output "GKE_cluster_name" {
  value = google_container_cluster.vectice.name
  description = "GKE cluster name"
}

output "GKE_region" {
  value = google_container_cluster.vectice.location
  description = "GKE cluster region"
}
