# # _TERRAFORM-S3-REPLICATION-CROSS-ACCOUNT_
This project is for use in replicating objects across different accounts on AWS
#### REQUIREMENTS

| Name | Version |
|------|---------|
|Terraform | = 0.11.15 |
| AWS | >= 2.70 |

#### PROVIDERS

| NAME | ALIAS | VERSION |
|------|---------|---------|
|provider_aws |  | 2.70
|provider_aws | origen | 2.70
|provider_aws | destination | 2.70

#### RESOURCES

| Name | Type |
|------|------|
| aws_iam_policy_document.origen_replication_role | data resource
| aws_iam_policy_document.origen_replication_policy | data resource
| aws_iam_policy_document.destination_bucket_policy | data resource
| aws_iam_policy_document.add_object_origen | data resource
| aws_caller_identity.origen | data resource
| aws_caller_identity.destination | data resource
| aws_s3_bucket.destination | resource
| aws_s3_bucket.origen | resource
| aws_iam_policy.add_object_origen | resource
| aws_iam_user.add_object_origen | resource
| aws_iam_access_key.add_object_origen | resource
| aws_iam_user_policy_attachment.add_object_origen | resource
| aws_iam_role.origen_replication | resource
| aws_iam_policy.origen_replication | resource
| aws_iam_role_policy_attachment.origen_replication | resource



#### INPUTS

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|source |Path to module | | ./modulo | Yes
|origen_bucket_name | Name of origen bucket| string | | Yes
|origen_region|Region of the origen bucket| string | us-east-1 | Yes
|destination_bucket_name | Name of destination bucket| string | | Yes
|destination_region|Region of the destination bucket| string | us-east-1 | Yes
|replication_name | Name of the replication rule| string | | Yes
|account_id | Number of account destination | string |  | Yes

#### HOW TO USE
```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "default"

}

provider "aws" {
  alias   = "origen"
  profile = "origen"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "destination"
  profile = "destination"
  region  = "us-east-1"
}

module "s3-cross-account-replication" {
  source                    = "./modulo"
  origen_bucket_name        = "bucket-cross-origen"
  origen_region             = "us-east-1"
  destination_bucket_name   = "bucket-cross-destination"
  destination_region        = "us-east-1"
  replication_name          = "teste-replicacao"
  account_id                = "304563978527"

  providers {
    "aws.origen"        = "aws.origen"
    "aws.destination"   = "aws.destination"
  }
}
```

