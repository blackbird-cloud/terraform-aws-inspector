resource "aws_inspector2_enabler" "default" {
  account_ids    = var.account_ids
  resource_types = var.resource_types
}

resource "aws_inspector2_organization_configuration" "default" {
  auto_enable {
    ec2         = contains(var.resource_types, "EC2")
    ecr         = contains(var.resource_types, "ECR")
    lambda      = contains(var.resource_types, "LAMBDA")
    lambda_code = contains(var.resource_types, "LAMBDA_CODE")
  }
  depends_on = [aws_inspector2_enabler.default]
}
