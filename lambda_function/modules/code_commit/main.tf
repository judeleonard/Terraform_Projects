provider "aws" {
  region  =     "${var.region}"
  profile = "${var.profile}"  
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}


resource "aws_codecommit_repository" "lambda-repo" {
  provider = aws
  repository_name = var.repo_name
  description     = var.code_commit_desc
  default_branch = "${var.branch}"

}
