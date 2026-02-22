# Comprehensive Terraform Templates Repository

This repository provides reusable infrastructure modules, structured environment scaffolding, and complete application templates to accelerate deployment on AWS.

## Directory Structure

- `modules/`: Contains generalized, reusable Terraform modules (`networking`, `compute`, `database`, `containers`, `storage`, `security`). These do not possess environment-specific configurations.
- `environments/`: Contains environment instantiations (e.g., `dev`, `prod`). These consume the modules from `modules/` and pass environment-specific parameters.
- `templates/`: Full architectural scaffolding for typical setups (e.g., a 3-tier web architecture or serverless API).

## Usage

1. Navigate to your desired environment under `environments/`.
2. Review the `variables.tf` and ensure any default values align with your AWS Region.
3. Configure the backend state in `providers.tf` (commented out by default).
4. Run standard Terraform workflows:
   ```bash
   terraform init
   terraform apply
   ```

## Creating a New Environment

Copy the `dev` environment as a base:
```bash
cp -r environments/dev environments/staging
```
Modify variables and state configurations as needed.

## Module Documentation

Module-level documentation is generated automatically by `terraform-docs` configured in `.github/workflows/docs.yml`. Upon pushing or opening a Pull Request, GitHub Actions will inject a `README.md` into each module detailing its inputs, outputs, and requirements.

## Testing

This repository uses the native Terraform testing framework (`.tftest.hcl`), available in Terraform v1.6.0 and later, to validate module behavior via actual infrastructure provisioning and tear down (`terraform apply` and assertions).

To test a specific module locally:
```bash
# Using the pre-configured Makefile
make test MODULE=networking

# Or using the Terraform CLI directly
cd modules/networking
terraform init
terraform test
```

*Note: running `terraform test` requires active AWS credentials as it provisions real resources in a sandbox environment and destroys them upon test completion.*