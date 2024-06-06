resource "aws_inspector2_enabler" "default" {
  account_ids    = var.account_ids
  resource_types = var.resource_types
}

resource "aws_inspector2_organization_configuration" "default" {
  auto_enable {
    ec2         = var.auto_enable && contains(var.resource_types, "EC2")
    ecr         = var.auto_enable && contains(var.resource_types, "ECR")
    lambda      = var.auto_enable && contains(var.resource_types, "LAMBDA")
    lambda_code = var.auto_enable && contains(var.resource_types, "LAMBDA_CODE")
  }
  depends_on = [aws_inspector2_enabler.default]
}

resource "aws_inspector2_member_association" "accounts" {
  for_each = {
    for account_id in var.associate_accounts_ids : account_id => account_id
  }

  account_id = each.value

  depends_on = [aws_inspector2_enabler.default]
}
