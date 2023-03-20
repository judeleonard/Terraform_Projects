output "repository_id" {
    value = aws_codecommit_repository.test-jude.repository_id
}

# Output the repo info back to main.tf
output "terraform_codecommit_repo_arn" {
  value = aws_codecommit_repository.test-jude.arn
}

output "clone_url_http" {
  description = "The URL to use for cloning the repository over HTTPS."
  value       = aws_codecommit_repository.test-jude.clone_url_http
}

output "clone_url_ssh" {
  description = "The URL to use for cloning the repository over SSH."
  value       = aws_codecommit_repository.test-jude.clone_url_ssh
}
output "root_account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "codecommit_role" {
  value = aws_iam_role.codecommit-role.name
}