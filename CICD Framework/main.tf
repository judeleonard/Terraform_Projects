module "code-commit" {
  source = "./modules/code_commit"
}

module "code-pipeline" {
    source = "./modules/code_pipeline"
    repo_name = module.code-commit.repository_name
    kms_arn = module.code-build.kms_arn
    code_build_package_arn = module.code-build.code_build_package_arn
}

module "code-build" {
    source = "./modules/code_build"
    repo_name = module.code-commit.repository_name
    build_artifact_bucket_arn = module.code-pipeline.build_artifact_bucket_arn
}
