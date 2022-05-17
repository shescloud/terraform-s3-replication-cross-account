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
  source                         = "./modulo"
  origen_bucket_name             = "origen_bucket_name"
  origen_region                  = "us-east-1"
  destination_bucket_name        = "destination_bucket_name "
  destination_region             = "us-east-1"
  replication_name               = "replication"
  account_id                     = "account_id"
  create_origen_bucket           = "false"
  create_destination_bucket      = "false"
  providers {
    "aws.origen"        = "aws.origen"
    "aws.destination"   = "aws.destination"
  }
}

