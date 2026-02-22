.PHONY: help init plan apply destroy fmt

# Defaults to dev environment if ENV is not specified
ENV ?= dev
TF_DIR = environments/$(ENV)

help:
	@echo "Terraform Makefile Helper"
	@echo "-------------------------"
	@echo "Usage: make [target] ENV=[environment]"
	@echo ""
	@echo "Environments: dev, prod (default: dev)"
	@echo ""
	@echo "Targets:"
	@echo "  help    - Show this help message"
	@echo "  init    - Initialize terraform in the specified environment"
	@echo "  plan    - Run terraform plan in the specified environment"
	@echo "  apply   - Run terraform apply in the specified environment"
	@echo "  destroy - Run terraform destroy in the specified environment"
	@echo "  fmt     - Format all terraform files in the repository"
	@echo "  docs    - Generate README.md documentation for all modules"
	@echo "  test    - Run terraform test in the specified module (e.g., make test MODULE=networking)"

init:
	@echo "Initializing $(ENV) environment..."
	cd $(TF_DIR) && terraform init

plan:
	@echo "Planning $(ENV) environment..."
	cd $(TF_DIR) && terraform plan -out=tfplan

apply:
	@echo "Applying $(ENV) environment..."
	cd $(TF_DIR) && terraform apply tfplan

destroy:
	@echo "Destroying $(ENV) environment..."
	cd $(TF_DIR) && terraform destroy

fmt:
	@echo "Formatting all Terraform files..."
	terraform fmt -recursive

docs:
	@echo "Generating Terraform module documentation..."
	@find modules environments templates -type d -not -path "*/.terraform/*" -exec bash -c 'ls {}/*.tf >/dev/null 2>&1 && terraform-docs markdown document --output-file README.md --output-mode replace {} || true' \;

test:
	@echo "Testing module $(MODULE)..."
	cd modules/$(MODULE) && terraform init && terraform test
