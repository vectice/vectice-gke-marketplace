#This File contains the configuration shared for all the environments
remote_state {
  backend  = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config   = {
    bucket = "vectice-terraform-states"
    prefix = "terraform/google/${path_relative_to_include()}/terraform.tfstate"
  }
}

locals {
  local_machine_public_ips = {
    "vectice-office"  = "1.1.1.1"
  }

  region   = "us-west1"
  provider = "google"
}

generate "public_ips" {
  path      = "public_ips.auto.tfvars"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
local_machine_public_ips = {
%{ for email, ip in local.local_machine_public_ips  ~}
  "${email}"="${ip}"
%{ endfor ~}
}
EOF
}