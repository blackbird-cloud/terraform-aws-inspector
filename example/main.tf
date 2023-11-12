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
