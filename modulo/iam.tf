//ORIGIN POLICY
resource "aws_iam_policy" "add_object_origen" {
  provider    = "aws.origen"
  name_prefix = "${local.replication_name}-origen-policy-put"
  policy      = "${data.aws_iam_policy_document.add_object_origen.json}"
}

//ORIGIN IAM USER
resource "aws_iam_user" "add_object_origen" {
  provider      = "aws.origen"
  name          = "${local.replication_name}-origen-user"
  force_destroy = true
}

//ORIGIN IAM ACCESS KEY USER
resource "aws_iam_access_key" "add_object_origen" {
  provider = "aws.origen"
  user     = "${aws_iam_user.add_object_origen.name}"
}


//ORIGEN ATTACHMENT POLICY
resource "aws_iam_user_policy_attachment" "add_object_origen" {
  provider   = "aws.origen"
  user       = "${aws_iam_user.add_object_origen.name}"
  policy_arn = "${aws_iam_policy.add_object_origen.arn}"
}

//REPLICATION ORIGEN ROLE
resource "aws_iam_role" "origen_replication" {
  provider           = "aws.origen"
  name               = "${local.replication_name}-replication-role"
  assume_role_policy = "${data.aws_iam_policy_document.origen_replication_role.json}"
}

//REPLICATION ORIGEN POLICY
resource "aws_iam_policy" "origen_replication" {
  provider = "aws.origen"
  name     = "${local.replication_name}-replication-policy"
  policy   = "${data.aws_iam_policy_document.origen_replication_policy.json}"
}

//ORIGEN REPLICATION ATTACHMENT POLICY
resource "aws_iam_role_policy_attachment" "origen_replication" {
  provider   = "aws.origen"
  role       = "${aws_iam_role.origen_replication.name}"
  policy_arn = "${aws_iam_policy.origen_replication.arn}"
}

