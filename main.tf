resource "aws_inspector2_enabler" "default" {
  account_ids    = var.account_ids
  resource_types = var.resource_types
}

resource "aws_inspector2_organization_configuration" "default" {
  auto_enable {
    ec2         = true
    ecr         = true
    lambda      = true
    lambda_code = true
  }
}
