
variable "tf_code_pipeline_name" {
    description = "code pipeline name"
  
}

variable "tf_codepipeline_role_policy_name" {
    description = "code pipeline role policy name"
  
}

variable "code_commit_name" {
    description = "code commit repository name"
  
}

variable "codebuild_project_terraform_apply_name" {
    description = "code build project terraform apply name"
}

variable "aws_access_key_2" {
    description = "aws access key environment for deploying code pipeline"
}
variable "aws_secret_key_2" {
    description = "aws secret key environment for deploying code pipeline"
}

variable "tf_codepipeline_artifact_bucket_name" {
    description = "s3 bucket location to store artifacts"  
}
variable "tf_codepipeline_role_name" {
    description = "code pipeline role name"
  
}
variable "s3_logging_bucket" {
    description = "s3 logs for code build"
  
}
variable "codebuild_iam_role_name" {
    description = "I am role name for codebuild"
}
variable "region" {
    description = "aws account region"
}
variable "root_account_id" {
    description = "root account id"  
}
variable "codecommit_role" {
    description = "codecommit role name"  
}