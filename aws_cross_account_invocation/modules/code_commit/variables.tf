variable "code_commit_name" {
    type = string
    description = "jude capstone project codecommit"
}

variable "code_commit_desc" {
    type = string
    description = "Jude demo codecommit desc"
}
variable "aws_access_key" {
    description = "aws account 1 access key"
  
}

variable "aws_secret_key" {
    description = "aws account 1 secret key"
}
variable "profile" {
    description = "aws account 1 profile name"
}
variable "region" {
    description = "aws account 1 region"
  
}
variable "destination_account_id" {
    description = "destination account to setup codebuild"
  
}
variable "codecommit_policy" {
    description = "codecommit policy"
}
variable "crossaccount_kms_arn" {
    description = "cross account kms arn"
}

variable "codecommit_role" {
    description = "codecommit role name"  
}