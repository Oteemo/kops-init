# kops-init
terraform module that sets up AWS with kops prerequisites

Developer Setup:

* Terraform
* https://downloads.chef.io/inspec
* Keybase

```make clean e2e```

## Usage

```hcl
provider "aws" {

}

module "kops_init" {
  #ref can point to master or a tag
  source = "git::https://github.com/oteemo/kops-init//modules/init-aws?ref=master"

  kops_user = "my-test-user"
  kops_group = "my-test-kops-group"
  pgp_key = "keybase:userame"
}
```

Setup a profile for AWS CLI
```bash

aws configure set profile.test-profile.region us-east-1
aws configure set profile.test-profile.output json
aws configure set profile.test-profile.aws_access_key_id \
    `terraform output my_kops_access_id`
aws configure set profile.test-profile.aws_secret_access_key \
    `terraform output my_kops_secret | base64 --decode | keybase pgp decrypt`    

export AWS_PROFILE=test-profile
```



