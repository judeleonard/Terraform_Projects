output "destination_account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "tf_iam_assumedPolicy" {
    value = aws_iam_policy.tf_iam_assumed_policy.name
}
output "codebuild_project_name" {
  value = aws_codebuild_project.lambda_codebuild_project.name
}