
#validate that the AWS_PROFILE is set
check_aws_profile:
	@if [ -z $$(env | grep -i aws_profile) ]; then \
		echo "Missing AWS_PROFILE environment variable"; \
		exit 2; \
	fi

check_tf:
	@if [ -z $$(which terraform) ]; then \
		echo "Terraform is not installed"; \
		exit 2; \
	fi

check_tf_docs:
	@if [ -z $$(which terraform-docs) ]; then \
		echo "Terraform is not installed"; \
		exit 2; \
	fi

bootstrap: check_aws_profile check_tf check_tf_docs

clean:
	@rm -rf .terraform
	@rm -rf *.tfstate
	@rm -rf *.tfstate.backup

tf: bootstrap
	@terraform init example
	@terraform apply -auto-approve --input=false example

tf_out: tf
	@terraform output --json > verify/files/terraform.json

test:
	@inspec exec verify -t aws://

e2e: tf_out test
	@terraform destroy -auto-approve --input=false example

docs:
	@hack/docs.sh