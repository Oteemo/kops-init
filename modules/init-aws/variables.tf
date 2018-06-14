variable "kops_user" {
  default = "kops"
}

variable "kops_group" {
  default = "kops"
}

variable "pgp_key" {
  description = "a pgp key to use to encrypt the access key"
  default = ""
}