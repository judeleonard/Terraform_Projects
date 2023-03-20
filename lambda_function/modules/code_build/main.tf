
provider "aws" {
  access_key = var.target_access_key
  secret_key = var.target_secret_key
  region = var.region
}

# Create codebuild project
resource "aws_codebuild_project" "lambda_codebuild_project" {
  name          = var.codebuild_project_name
  description   = "Terraform codebuild project"
  build_timeout = "5"
  service_role  = aws_iam_role.codebuild_iam_role.arn

  artifacts {
    type = "CODEPIPELINE"
  }

  cache {
    type     = "S3"
    location = "${var.project_bucket_name}/${var.repo_name}_artifact"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:2.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"

    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = "${var.region}"
    }

    environment_variable {
      name  = "TERRAFORM_VERSION"
      value = "1.3.7"
    }

    environment_variable {
      name  = "PROJECT_BUCKET"
      value = "${var.bucket}"
    }

    environment_variable {
      name  = "MY_PATH"
      value = "${var.repo_name}"
    }

    environment_variable {
      name  = "LAMBDA_ROLE_ARN"
      value = "${var.lambda_role_arn}"
    }
    
    
  }

  logs_config {
    cloudwatch_logs {
      group_name  = "log-group"
      stream_name = "log-stream"
    }

    s3_logs {
      status   = "ENABLED"
      location = "${var.project_bucket_id}/${var.repo_name}_logs/build-log"  
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("modules/code_build/buildspec/buildspec.yml") 
  
  }

  tags = {
    Environment = "${var.branch}"
  }
}
