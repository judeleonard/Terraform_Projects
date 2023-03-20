output "lambda_repo_arn" {
    value = aws_codecommit_repository.lambda-repo.arn
}
output "lambda_repo_id" {
    value = aws_codecommit_repository.lambda-repo.id
}
output "root_account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "repo_name" {
    value = aws_codecommit_repository.lambda-repo.repository_name
}
output "codecommit_role" {
  value = aws_iam_role.codecommit-role.name
}