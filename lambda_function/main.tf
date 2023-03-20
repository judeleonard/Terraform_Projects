module "codecommit" {
  source                   = "./modules/code_commit"
  code_commit_desc         = var.code_commit_desc
  repo_name                = var.repo_name
  aws_secret_key           = var.aws_secret_key
  aws_access_key           = var.aws_access_key
  profile                  = var.profile
  region                   = var.region
  codecommit_policy        = var.codecommit_policy 
  destination_account_id   = module.codebuild.destination_account_id
  codecommit_role          = var.codecommit_role
  kms_arn                  = module.codepipeline.kms_arn 
  branch                   = var.branch
}


module "codebuild" {
  source                                 = "./modules/code_build"
  codebuild_project_name                 = var.codebuild_project_name
  codebuild_iam_role_name                = var.codebuild_iam_role_name
  tf_iam_assumedPolicy                   = var.tf_iam_assumedPolicy 
  project_bucket_arn                     = module.codepipeline.project_bucket_arn 
  root_account_id                        = module.codecommit.root_account_id 
  target_access_key                      = var.target_access_key 
  target_secret_key                      = var.target_secret_key
  region                                 = var.region 
  project_bucket_id                      = module.codepipeline.project_bucket_id 
  project_bucket_name                    = module.codepipeline.project_bucket_name
  branch                                 = var.branch        
  repo_name                              = module.codecommit.repo_name
  bucket                                 = var.bucket
  lambda_role_arn                        = module.lambda.lambda_role_arn 

}

module "codepipeline" {
  source                                 = "./modules/code_pipeline"
  repo_name                              = module.codecommit.repo_name
  root_account_id                        = module.codecommit.root_account_id
  codebuild_project_name                 = module.codebuild.codebuild_project_name
  codecommit_role                        = module.codecommit.codecommit_role
  tf_codepipeline_role_policy_name       = var.tf_codepipeline_role_policy_name 
  tf_codepipeline_role_name              = var.tf_codepipeline_role_name
  tf_code_pipeline_name                  = var.tf_code_pipeline_name
  bucket                                 = var.bucket
  target_access_key                      = var.target_access_key 
  target_secret_key                      = var.target_secret_key
  region                                 = var.region 
  s3_bucket_logs                         = var.s3_bucket_logs
  branch                                 = var.branch
}

module "lambda" {
  source                                 = "./modules/lambda"
  lambda_policy                          = var.lambda_policy
  lambda_assumedPolicy                   = var.lambda_assumedPolicy
  lambda_role                            = var.lambda_role
  destination_account_id                 = module.codebuild.destination_account_id
  project_bucket_id                      = module.codepipeline.project_bucket_id       
  target_access_key                      = var.target_access_key 
  target_secret_key                      = var.target_secret_key
  region                                 = var.region 
  lambda_service_role                    = var.lambda_service_role
  bucket                                 = var.bucket
  repo_name                              = module.codecommit.repo_name 
  branch                                 = var.branch
  lambda_cross_role_name                 = module.codepipeline.lambda_cross_role_name
  tf_codepipeline_role_name              = var.tf_codepipeline_role_name
}