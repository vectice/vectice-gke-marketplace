include "root" {
  path = find_in_parent_folders()
}

# Values necessary to build the infrastructure
inputs = {
  project_id           = "project-id"
  region               = "us-west1"
  zone                 = "us-west1-a"
  network              = "vpc-name"
  subnetwork           = "subnet-name"
  cidr_range_subnet1   = "10.0.1.0/24"
  cidr_range_subnet2   = "10.0.2.0/24"
  # Kubernetes Engine
  cluster_name         = "test-cluster-ts"
  node_pool_name       = "test-cluster-ts-pool"
  machine_type         = "e2-standard-4"
  initial_node_count   = 3
  min_node_count       = 2
  max_node_count       = 4
  # Cloud SQL
  sql_instance_id      = "vectice-ts"
  backup_start_time    = "08:00"
  db_username          = "db-user"
  db_password          = "db-password"
  vectice_db_name      = "vectice"
  keycloak_db_name     = "keycloak"
  availability_type    = "REGIONAL"
  # Cloud Storage
  project_bucket_name  = "project-test-vectice"
  storage_location     = "US"
  storage_class        = "STANDARD"
  service_account_name = "vectice-service-account"
  gcp_role_storage     = "vectice_role_storage"
}

#GKE machine type possible value description:
# e2-medium: 1 vCPU, 4 GB RAM
# e2-standard-2: 2 vCPUs, 8 GB RAM
# e2-standard-4: 4 vCPUs, 16 GB RAM
# e2-standard-8: 8 vCPUs, 32 GB RAM
# e2-standard-16: 16 vCPUs, 64 GB RAM
# e2-standard-32: 32 vCPUs, 128 GB RAM
# e2-standard-64: 64 vCPUs, 256 GB RAM
# e2-highmem-2: 2 vCPUs, 16 GB RAM
# e2-highmem-4: 4 vCPUs, 32 GB RAM
# e2-highmem-8: 8 vCPUs, 64 GB RAM
# e2-highmem-16: 16 vCPUs, 128 GB RAM
# e2-highmem-32: 32 vCPUs, 256 GB RAM
# e2-highmem-64: 64 vCPUs, 512 GB RAM
# e2-highcpu-2: 2 vCPUs, 2 GB RAM
# e2-highcpu-4: 4 vCPUs, 4 GB RAM
# e2-highcpu-8: 8 vCPUs, 8 GB RAM
# e2-highcpu-16: 16 vCPUs, 16 GB RAM
# e2-highcpu-32: 32 vCPUs, 32 GB RAM
# e2-highcpu-64: 64 vCPUs, 64 GB RAM

#SQL instance machine type value description
# db-n1-standard-1: 1 vCPU, 3.75 GB RAM
# db-n1-standard-2: 2 vCPUs, 7.5 GB RAM
# db-n1-standard-4: 4 vCPUs, 15 GB RAM
# db-n1-standard-8: 8 vCPUs, 30 GB RAM
# db-n1-standard-16: 16 vCPUs, 60 GB RAM
# db-n1-standard-32: 32 vCPUs, 120 GB RAM
# db-n1-standard-64: 64 vCPUs, 240 GB RAM
# db-n1-highmem-2: 2 vCPUs, 13 GB RAM
# db-n1-highmem-4: 4 vCPUs, 26 GB RAM
# db-n1-highmem-8: 8 vCPUs, 52 GB RAM
# db-n1-highmem-16: 16 vCPUs, 104 GB RAM
# db-n1-highmem-32: 32 vCPUs, 208 GB RAM
# db-n1-highmem-64: 64 vCPUs, 416 GB RAM
# db-n1-highcpu-2: 2 vCPUs, 1.8 GB RAM
# db-n1-highcpu-4: 4 vCPUs, 3.6 GB RAM
# db-n1-highcpu-8: 8 vCPUs, 7.2 GB RAM
# db-n1-highcpu-16: 16 vCPUs, 14.4 GB RAM
# db-n1-highcpu-32: 32 vCPUs, 28.8 GB RAM
# db-n1-highcpu-64: 64 vCPUs, 57.6 GB RAM