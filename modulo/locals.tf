locals {
  "origen_bucket_arn"                = "arn:aws:s3:::${var.origen_bucket_name}"
  "destination_bucket_arn"           = "arn:aws:s3:::${var.destination_bucket_name}"
  "origen_bucket_object_arn"         = "arn:aws:s3:::${var.origen_bucket_name}/${var.replicate_prefix}*"
  "destination_bucket_object_arn"    = "arn:aws:s3:::${var.destination_bucket_name}/${var.replicate_prefix}*"
  "replication_name"                 = "tf-${var.replication_name}"
  "origen_root_user_arn"             = "arn:aws:iam::${data.aws_caller_identity.origen.account_id}:root"
}
