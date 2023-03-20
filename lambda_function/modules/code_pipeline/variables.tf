variable "tf_codepipeline_role_name" {
    description = "code pipeline role name"  
}
variable "tf_codepipeline_role_policy_name" {
    description = "code pipeline role policy name"
  
}
variable "root_account_id" {
    description = "root account id"  
}
variable "repo_name" {
    description = "repo name"  
}

variable "codecommit_role" {
    description = "code commit role" 
}
variable "tf_code_pipeline_name" {
    description = "code pipeline name"
  
}
variable "bucket" {
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
variable "s3_bucket_logs" {
    description = "location for storing codebuild logs"  
}
variable "branch" {
    description = "repo branch"  
}
variable "codebuild_project_name" {
    description = "codebuild project name"  
}