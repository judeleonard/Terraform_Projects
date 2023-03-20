## ---- modules/code_build/outputs.tf -----

# output s3 bucket log id to main.tf

output "tf_iam_assumedPolicy" {
    value = aws_iam_policy.tf_iam_assumed_policy.name
}
output "destination_account_id" {
  value = data.aws_caller_identity.current.account_id
}
