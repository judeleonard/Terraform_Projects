
##### build terraform code commit ################
module "codecommit" {
  source           = "./modules/code_commit"
  code_commit_desc = var.code_commit_desc
  code_commit_name = var.code_commit_name
  aws_access_key   = var.aws_access_key
  aws_secret_key   = var.aws_secret_key
  region           = var.region
  profile          = var.profile 
  codecommit_policy = var.codecommit_policy 
  destination_account_id = module.codebuild.destination_account_id
  codecommit_role = var.codecommit_role
  crossaccount_kms_arn   = module.codepipeline.crossaccount_kms_arn
}

##### code build for terraform plan and apply ############# 
module "codebuild" {
  source                                 = "./modules/code_build"
  codebuild_project_terraform_apply_name = var.codebuild_project_terraform_apply_name
  codebuild_iam_role_name                = var.codebuild_iam_role_name
  codebuild_iam_role_policy_name         = var.codebuild_iam_role_policy_name 
  s3_logging_bucket_id                   = module.codepipeline.s3_logging_bucket_id
  s3_logging_bucket                      = module.codepipeline.s3_logging_bucket
  clone_url_http                         = module.codecommit.clone_url_http
  tf_iam_assumedPolicy                 = var.tf_iam_assumedPolicy 
  terraform_codecommit_repo_arn        = module.codecommit.terraform_codecommit_repo_arn
  tf_codepipeline_artifact_bucket_arn  = module.codepipeline.tf_codepipeline_artifact_bucket_arn
  tf_iam_assumedRole                   = var.tf_iam_assumedRole
  aws_access_key_2                     = var.aws_access_key_2
  aws_secret_key_2                     = var.aws_secret_key_2
  region                               = var.region     
  root_account_id                      = module.codecommit.root_account_id 
}

###### build terraform code pipeline
module "codepipeline" {
  source                = "./modules/code_pipeline"
  tf_code_pipeline_name = var.tf_codepipeline_name        
  tf_codepipeline_artifact_bucket_name   = var.tf_codepipeline_artifact_bucket_name
  tf_codepipeline_role_name              = var.tf_codepipeline_role_name
  tf_codepipeline_role_policy_name       = var.tf_codepipeline_role_policy_name
  code_commit_name                       = var.code_commit_name
  codecommit_role                        = module.codecommit.codecommit_role 
  codebuild_project_terraform_apply_name = var.codebuild_project_terraform_apply_name
  s3_logging_bucket                      = var.s3_logging_bucket 
  codebuild_iam_role_name                = var.codebuild_iam_role_name
  aws_access_key_2                       = var.aws_access_key_2
  aws_secret_key_2                       = var.aws_secret_key_2
  region                                 = var.region    
  root_account_id                        = module.codecommit.root_account_id 
}