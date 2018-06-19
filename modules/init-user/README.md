## init-aws

Sets up the kops IAM requirements

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

