data "aws_caller_identity" "current" {}

resource "aws_inspector2_delegated_admin_account" "default" {
  account_id = data.aws_caller_identity.current.account_id
}

module "inspector" {
  source  = "blackbird-cloud/inspector/aws"
  version = "~> 2"

  account_ids    = [data.aws_caller_identity.current.account_id]
  resource_types = ["LAMBDA", "LAMBDA_CODE", "EC2", "ECR"]

  associate_accounts_ids = ["12345678910", "12345678911"]

  depends_on = [aws_inspector2_delegated_admin_account.default]
}
