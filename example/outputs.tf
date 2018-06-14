output "my_kops_user" {
  value = "${module.kops_init.this_user}"
}

output "my_kops_group" {
  value = "${module.kops_init.this_group}"
}

output "my_kops_secret" {
  value = "${module.kops_init.this_secret}"
}

output "my_kops_access_id" {
  value = "${module.kops_init.this_access_id}"
}