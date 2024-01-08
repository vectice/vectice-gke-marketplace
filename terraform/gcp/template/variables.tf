#Variables required to create resources
#global

variable "storage_location" {
  type    = string
  default = "US"
}

variable "project_id" {
  type    = string
  default = "project-id"
}

variable "service_account_name" {
  type = string
}

variable "gcp_role_storage" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}
variable "network" {
  type = string
  default = "default"
}

variable "subnetwork" {
  type = string
  default = "default"
}
variable "cidr_range_subnet1" {
  type = string
}

variable "cidr_range_subnet2" {
  type = string
}

#Bucket storage
variable "project_bucket_name" {
  type = string
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}


#Cloud SQL 
variable "sql_instance_id" {
  type = string
}

variable "backup_start_time" {
  type = string
  default = "08:00"
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type = string
}

variable "local_machine_public_ips" {
  type = map
}
variable "ipv4_enablement" {
  type = bool
  default = true
}

variable "availability_type" {
  type = string
  default = "REGIONAL"
}

variable "vectice_db_name" {
  type = string
  default = "vectice"
}

variable "keycloak_db_name" {
  type = string
  default = "keycloak"
}

variable "client_cert_name" {
  type = string
  default = "client-cert"
}

#Kubernetes variables 
variable "cluster_name" {
  type    = string
  default = "vectice-cluster"
}

variable "node_pool_name" {
  type    = string
  default = "vectice-pool"
}

variable "initial_node_count" {
  type    = number
  default = 3
}
variable "min_node_count" {
  type    = number
  default = 2
}

variable "max_node_count" {
  type    = number
  default = 4
}
variable "machine_type" {
  type    = string
  default = "e2-standard"
}


