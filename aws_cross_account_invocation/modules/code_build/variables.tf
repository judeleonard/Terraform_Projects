## ---- modules/code_build/variables.tf ------

variable "codebuild_iam_role_name" {
  description = "Name for IAM role to be used by CodeBuild"
}

variable "codebuild_project_terraform_apply_name" {
    description = "name of the code build terraform plan"  
}

variable "clone_url_http" {
    description = "repository url for cloning over HTTPS"
  
}
variable "aws_access_key_2" {
    description = "aws access key environment for deploying code pipeline"
}
variable "aws_secret_key_2" {
    description = "aws secret key environment for deploying code pipeline"  
}

variable "s3_logging_bucket" {
    type = string
    description = " the name of the s3 bucket for storing our log files"  
}

variable "s3_logging_bucket_id" {
    description = "log s3 bucket id"  
}

variable "tf_iam_assumedPolicy" {
    description = "iam assumed role name for code build"
}
variable "terraform_codecommit_repo_arn" {
    description = "codecommit repo arn for needed for codebuild" 
}

variable "tf_iam_assumedRole" {
    description = "iam assumedRole"
}
variable "region" {
    description = "aws account region"
}
variable "tf_codepipeline_artifact_bucket_arn" {
    description = "aritfact bucket arn for codepipeline"  
}
variable "codebuild_iam_role_policy_name" {
    description = "codebuild iam role policy"
  
}
variable "root_account_id" {
    description = "root account id"  
}