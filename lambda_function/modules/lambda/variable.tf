# variable "root_account_id" {
#     description = "csc account id"  
# }
variable "lambda_policy" {
    description = "lambda iam policy"
}
variable "lambda_role" {
    description = "lambda iam role"  
}

variable "target_access_key" {
    description = "target access key credential"
  }
variable "target_secret_key" {
    description = "target account secret key"
}
variable "region" {
    description = "target account region"
}
variable "project_bucket_id" {
    description = "project bucket id"
}
variable "lambda_service_role" {
    description = "service role for lambda"
}
variable "bucket" {
    description = "project bucket name"  
}
variable "lambda_assumedPolicy" {
    description = "assumed policy for lambda" 
}
variable "repo_name" {
    description = "codecommit repo name"  
}
variable "branch" {
    type = string  
}
variable "destination_account_id" {
    description = "target account ID"  
}
variable "lambda_cross_role_name" {
    type = string  
}
variable "tf_codepipeline_role_name" {
    type = string  
}