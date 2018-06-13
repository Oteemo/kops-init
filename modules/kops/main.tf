resource "aws_iam_user" "this" {
  name = "${var.kops_user}"
}
