resource "aws_s3_bucket" "destination" {
  provider = "aws.destination"
  bucket   = "${var.destination_bucket_name}"
  region   = "${var.destination_region}"
  policy   = "${data.aws_iam_policy_document.destination_bucket_policy.json}"

  versioning {
    enabled = true
  }
}
