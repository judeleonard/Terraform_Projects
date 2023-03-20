# provider "aws" {
#   access_key = "${var.aws_access_key}"
#   secret_key = "${var.aws_secret_key}"
#   region =     "${var.region}"
#   alias = "jude_codebuild_iam_role"
#   # assume_role {
#   #   role_arn ="arn:aws:iam::${var.destination_account_id}:role/${var.codebuild_iam_role_name}"
#   #   session_name = var.profile
#   #   }

# }

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region =     "${var.region}"
  profile = "${var.profile}"  
}

resource "aws_codecommit_repository" "test-jude" {
  provider = aws
  repository_name = var.code_commit_name
  description     = var.code_commit_desc
  lifecycle {
    create_before_destroy = true
  }
}