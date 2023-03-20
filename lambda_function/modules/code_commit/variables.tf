variable "repo_name" {
    type = string
    description = "jude lambda codecommit"
}

variable "code_commit_desc" {
    type = string
    description = "jude lambda codecommit"
}
variable "region" {
    description = "aws account region"  
}
variable "aws_access_key" {
    description = "aws access key"
}
variable "aws_secret_key" {
    description = "aws secret key"
}
variable "profile" {
    description = "aws session state"  
}
variable "codecommit_role" {
    description = "codecommit role name"
  
}
variable "destination_account_id" {
  description = "Account ID of the target account"
}
variable "codecommit_policy" {
    description = "policy for code commit" 
}
variable "kms_arn" {
    description = "cross account kms arn"
}
variable "branch" {
    type = string  
}