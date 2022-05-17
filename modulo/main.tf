provider "aws" {
  alias = "origen"
}

provider "aws" {
  alias = "destination"
}

data "aws_caller_identity" "origen" {
  provider = "aws.origen"
}

data "aws_caller_identity" "destination" {
  provider = "aws.destination"
}