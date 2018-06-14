output "this_user" {
  description = "the kops username"
  value = "${aws_iam_user.this.name}"
}

output "this_group" {
  description = "the kops group"
  value = "${aws_iam_group.this.name}"
}

output "this_access_id" {
  description = "the kops user access_key_id"
  value = "${aws_iam_access_key.this.id}"
}

output "this_secret" {
  value = "${aws_iam_access_key.this.encrypted_secret}"
}