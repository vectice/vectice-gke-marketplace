
resource "google_service_account" "vectice_bucket_service_account" {
  account_id   = var.service_account_name
  display_name = var.service_account_name
  description  = "Used in backend"
}

resource "google_project_iam_custom_role" "buckets-storage" {
  role_id     = var.gcp_role_storage
  title       = var.gcp_role_storage
  description = "role used by service account for vectice backend storage"
  permissions = [
    "storage.buckets.get", "storage.buckets.list", "storage.objects.create", "storage.objects.delete",
    "storage.objects.get", "storage.objects.list", "storage.objects.update"
  ]
}

resource "google_project_iam_member" "buckets-storage" {
  role   = google_project_iam_custom_role.buckets-storage.id
  project = var.project_id
  member = "serviceAccount:${google_service_account.vectice_bucket_service_account.email}"
}

resource "google_service_account_key" "vectice_bucket_service_account_key" {
  service_account_id = google_service_account.vectice_bucket_service_account.name
}

resource "local_file" "vectice_bucket_service_account_key_file" {
  content  = base64decode(google_service_account_key.vectice_bucket_service_account_key.private_key)
  filename = "vectice_bucket_service_account.json"
}

resource "local_file" "vectice_bucket_service_account_key_encoded_file" {
  content  = google_service_account_key.vectice_bucket_service_account_key.private_key
  filename = "vectice_bucket_service_account.encoded.json"
}