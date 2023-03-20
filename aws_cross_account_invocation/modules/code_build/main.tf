
#################################################
 # Code build for terraform plan
#######################################################

provider "aws" {
  access_key = var.aws_access_key_2
  secret_key = var.aws_secret_key_2
  region = var.region

}

# Create CodeBuild Project for Terraform Apply
resource "aws_codebuild_project" "codebuild_project_terraform_apply" {
  name          = var.codebuild_project_terraform_apply_name
  description   = "Terraform codebuild project"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_iam_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type     = "S3"
    location = var.s3_logging_bucket
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "us-east-1"
    }
    
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.s3_logging_bucket_id}/${var.codebuild_project_terraform_apply_name}/build-log"
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("modules/code_build/buildspec_terraform_apply.yml") 
  
  }

  tags = {
    Environment = "Test"
  }
}
