resource "aws_iam_user" "this" {
  name = "${var.kops_user}"
}

resource "aws_iam_access_key" "this" {
  user = "${aws_iam_user.this.name}"
  pgp_key = "${var.pgp_key}"
}

resource "aws_iam_group" "this" {
  name = "${var.kops_group}"
}

resource "aws_iam_group_membership" "this" {
  name = "group_membership"

  users = [
    "${aws_iam_user.this.name}",
  ]

  group = "${aws_iam_group.this.name}"
}

# Attach required kops policies
resource "aws_iam_group_policy_attachment" "ec2" {
  group      = "${aws_iam_group.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "route53" {
  group      = "${aws_iam_group.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_group_policy_attachment" "s3" {
  group      = "${aws_iam_group.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_group_policy_attachment" "iam" {
  group      = "${aws_iam_group.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

resource "aws_iam_group_policy_attachment" "vpc" {
  group      = "${aws_iam_group.this.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}