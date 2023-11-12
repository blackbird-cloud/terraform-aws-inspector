variable "account_ids" {
  type        = list(string)
  description = "(Required) Set of account IDs. Can contain one of: the Organization's Administrator Account, or one or more Member Accounts."
}

variable "resource_types" {
  type        = list(string)
  description = "(Required) Type of resources to scan. Valid values are EC2, ECR, and LAMBDA. At least one item is required."
  default     = ["LAMBDA", "LAMBDA_CODE", "EC2", "ECR"]
}
