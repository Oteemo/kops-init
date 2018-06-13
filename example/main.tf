provider "aws" {
  region = "us-east-1"
}

module "kops_init" {
  source = "../modules/kops"

  kops_user = "my-test-user"
}