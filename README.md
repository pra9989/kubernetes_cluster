# Terraform EKS - YAML Driven Configuration

This project creates an AWS EKS cluster using Terraform while keeping environment-specific
configuration in `values.yaml`.

## Structure

- `environments/dev/values.yaml` - cluster, network, IAM, node groups and addons
- `environments/dev/main.tf` - loads YAML with `yamldecode()`
- `modules/eks/` - reusable EKS implementation
- `versions.tf` - Terraform/provider requirements
- `providers.tf` - AWS provider

## Deploy

From `environments/dev`:

```powershell
terraform init
terraform validate
terraform plan
terraform apply
```

## Destroy

```powershell
terraform destroy
```

## Change environment

Copy `environments/dev` to `sit`, `uat`, or `prod` and change only `values.yaml`.
The same reusable EKS module can then be used for each environment.

## Notes

- Update the AWS region and Kubernetes version in `values.yaml` as required.
- The example uses the Terraform AWS VPC module.
- Review organization policies, IAM permissions, KMS, NAT gateway architecture,
  security groups, and endpoint access before production use.
