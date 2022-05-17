resource "aws_s3_bucket" "origen" {
  provider = "aws.origen"
  bucket   = "${var.origen_bucket_name}"
  region   = "${var.origen_region}"

  versioning {
    enabled = true
  }

  replication_configuration {
    role = "${aws_iam_role.origen_replication.arn}"

    rules {
      id     = "${local.replication_name}"
      status = "Enabled"
      prefix = "${var.replicate_prefix}"

      destination {
        bucket        = "${local.destination_bucket_arn}"
        storage_class = "STANDARD"
        account_id    = "${var.account_id}"
        //replica_kms_key_id = "arn:aws:kms:us-east-1:532498267469:key/81525ab3-f99a-4157-8b71-ab6353b7261a"
        access_control_translation = {
          owner = "Destination"
        }


      }


    }
  }
}
