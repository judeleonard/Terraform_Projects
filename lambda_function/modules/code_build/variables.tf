variable "codebuild_iam_role_name" {
  description = "Name for IAM role to be used by CodeBuild"
}

variable "codebuild_project_name" {
    description = "name of the code build terraform plan"  
}

variable "root_account_id" {
    description = "root account id"  
}

variable "project_bucket_arn" {
    description = "project bucket arn"  
}
variable "project_bucket_name" {
    description = "project bucket name"  
}
variable "project_bucket_id" { 
    description = "project bucket id"  
}

variable "tf_iam_assumedPolicy" {
    type = string
}
variable "target_access_key" {
    type = string
  }
variable "target_secret_key" {
    description = "target account secret key"
}
variable "region" {
    description = "target account region"
}
variable "bucket" {
    description = "project target bucket"  
}

variable "branch" {
    type = string  
}

variable "repo_name" {
  type = string
}
variable "lambda_role_arn" {
    description = "ARN for lambda"  
}