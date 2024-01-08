# Vectice GCP Terraform

In total, Terraform files in this folder will provision foreach environment: 
- 1 GKE cluster with 1 node pool, 
- 1 PostgreSQL instance with 1 user and 2 databases, 
- 1 Storage bucket.
- 1 Service Account with read/write permissions on the Bucket


## Prerequisites

### `gcloud`

In order for Terraform to run operations on your behalf, you must install and configure the `gcloud` SDK tool. Follow [these quickstart instructions](https://cloud.google.com/sdk/docs/quickstarts) to get started.

#### Installation

Refer to <https://cloud.google.com/sdk/docs/install> or choose a package manager based on your operating system.

##### Install `gcloud` on macOS with Homebrew

``` sh
brew install --cask google-cloud-sdk
```

##### Install `gcloud` on Windows with Chocolatey

``` sh
choco install gcloudsdk
```

#### Configuration

After you've installed the `gcloud` SDK, initialize it by running the following command.

``` sh
gcloud init
```

This will authorize the SDK to access GCP using your user account credentials and add the SDK to your PATH. You will be asked to login and select the project you want to work in. Finally, add your account to the Application Default Credentials (ADC). This will allow Terraform to access these credentials to provision resources on Google Cloud.

``` sh
gcloud auth application-default login
```

## Template Folder Structure

We recommend that you make a copy of the template folder and edit in the copy folder. 
[`provider.tf`](provider.tf) defines Terraform and Google provider versions.

[`variables.tf`](variables.tf) is a file where all variables and their types are defined

[`outputs.tf`](outputs.tf) echoes some key variables.

[`sa-and-permissions.tf`](sa-and-permissions.tf) creates the Service Account with read/write permissions on the Bucket

[`kubernetes_engine.tf`](kubernetes_engine.tf) provisions a GKE cluster and a separately managed node pool.

[`cloud_sql.tf`](cloud_sql.tf) provisions a Cloud SQL instance of PostgreSQL, a user and two databases.

[`bucket.tf`](bucket.tf) provisions a Cloud Storage bucket. Note that the bucket name must be unique globally.

[`vpc.tf`](vpc.tf) provisions a VPC and 2 subnetworks in which the other resources will be put.

## Update Other Properties

Most important configurable resource properties are described in these Terraform scripts. There are times that you may want to change some of them, for example to increase the SQL disk size. Then just go to that corresponding `.tf` file and change the related settings. Available arguments and attributes can be found in [Documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs) of the Google provider.

## Initialize Terragrunt Workspace

After you have saved your customized variables file, initialize your Terragrunt workspace, by positionning yourself in the directory where are all .tf files

``` sh
cd copytemplatefolder; terragrunt init
```
## Test the code

After you have saved your customized variables file, test what your code will produce

``` sh
terragrunt plan
```

## Provision

``` sh
terragrunt apply
```

Review the planned actions. Confirm it with a `yes` to start provisioning if everything is correct. The whole creation process can take more than 30 minutes, so be patient not to interrupt it.

## Destroy 

``` sh
terragrunt destroy
```

Review the planned actions. Confirm it with a `yes` to start destroying if everything is correct. The whole destruction process can take more than 30 minutes, so be patient not to interrupt it.