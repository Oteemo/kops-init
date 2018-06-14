# kops-init
terraform module that sets up aws with kops prerequisites

Developer Setup:

* Terraform
* https://downloads.chef.io/inspec
* Keybase

The easiest way to test is to use the AWS_PROFILE environment variable

```make clean e2e```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| kops_group |  | string | `kops` | no |
| kops_user |  | string | `kops` | no |
| pgp_key | a pgp key to use to encrypt the access key | string | `` | no |

## Outputs

| Name | Description |
|------|-------------|
| this_access_id | the kops user access_key_id |
| this_group | the kops group |
| this_secret |  |
| this_user | the kops username |

