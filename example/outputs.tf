output "my_kops_user" {
  value = "${module.kops_init.this_user}"
}