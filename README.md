# AWS Inspector Organization configuration Terraform module
A Terraform module which configures your AWS Inspector. https://docs.aws.amazon.com/inspector/latest/user/what-is-inspector.html
[![blackbird-logo](https://raw.githubusercontent.com/blackbird-cloud/terraform-module-template/main/.config/logo_simple.png)](https://www.blackbird.cloud)

## Example
```hcl
data "aws_caller_identity" "current" {}

resource "aws_inspector2_delegated_admin_account" "default" {
  account_id = data.aws_caller_identity.current.account_id
}

module "inspector" {
  source  = "blackbird-cloud/inspector/aws"
  version = "~> 1"

  account_ids    = [data.aws_caller_identity.current.account_id]
  resource_types = ["LAMBDA", "LAMBDA_CODE", "EC2", "ECR"]

  depends_on = [aws_inspector2_delegated_admin_account.default]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.25.0 |

## Resources

| Name | Type |
|------|------|
| [aws_inspector2_enabler.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_enabler) | resource |
| [aws_inspector2_organization_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/inspector2_organization_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_ids"></a> [account\_ids](#input\_account\_ids) | (Required) Set of account IDs. Can contain one of: the Organization's Administrator Account, or one or more Member Accounts. | `list(string)` | n/a | yes |
| <a name="input_resource_types"></a> [resource\_types](#input\_resource\_types) | (Required) Type of resources to scan. Valid values are EC2, ECR, and LAMBDA. At least one item is required. | `list(string)` | <pre>[<br>  "LAMBDA",<br>  "LAMBDA_CODE",<br>  "EC2",<br>  "ECR"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_inspector2_enabler"></a> [aws\_inspector2\_enabler](#output\_aws\_inspector2\_enabler) | Terraform resource for enabling Amazon Inspector resource scans. |
| <a name="output_aws_inspector2_organization_configuration"></a> [aws\_inspector2\_organization\_configuration](#output\_aws\_inspector2\_organization\_configuration) | erraform resource for managing an Amazon Inspector Organization Configuration. |

## About

We are [Blackbird Cloud](https://blackbird.cloud), Amsterdam based cloud consultancy, and cloud management service provider. We help companies build secure, cost efficient, and scale-able solutions.

Checkout our other :point\_right: [terraform modules](https://registry.terraform.io/namespaces/blackbird-cloud)

## Copyright

Copyright © 2017-2023 [Blackbird Cloud](https://www.blackbird.cloud)