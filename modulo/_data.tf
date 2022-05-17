

//ORIGEN ASSUME ROLE
data "aws_iam_policy_document" "origen_replication_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}

//ORIGEN PERMISSION
data "aws_iam_policy_document" "origen_replication_policy" {
  statement {
    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [
      "${local.origen_bucket_arn}",
    ]
  }

  statement {
    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
    ]

    resources = [
      "${local.origen_bucket_object_arn}",
    ]
  }

  statement {
    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ObjectOwnerOverrideToBucketOwner",
    ]

    resources = [
      "${local.destination_bucket_object_arn}",
    ]
  }
}

//DESTINATION PERMISSION
data "aws_iam_policy_document" "destination_bucket_policy" {
  statement {
    sid = "replicate-objects-from-${data.aws_caller_identity.origen.account_id}-to-prefix-${var.replicate_prefix}"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ObjectOwnerOverrideToBucketOwner",
    ]

    resources = [
      "${local.destination_bucket_object_arn}",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${local.origen_root_user_arn}",
      ]
    }
  }

}

//ORIGEN ADD OBJECT PERMISSION
data "aws_iam_policy_document" "add_object_origen" {
  statement {
    actions = [
      "s3:PutObject",
    ]

    resources = [
      "${local.origen_bucket_object_arn}",
    ]
  }

  statement {
    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "${local.origen_bucket_arn}",
    ]
  }


}


