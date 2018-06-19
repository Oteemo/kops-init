provider "aws" {
  region = "us-east-1"
}

module "kops_init" {
  source = "../modules/init-user"

  kops_user = "my-test-user"
  kops_group = "my-test-kops-group"
  pgp_key = "keybase:gmead"
}