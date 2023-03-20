provider "aws" {
  access_key = var.target_access_key
  secret_key = var.target_secret_key
  region = var.region
}


# create the pipeline 
resource "aws_codepipeline" "codepipeline" {
  name     = var.tf_code_pipeline_name
  role_arn = aws_iam_role.jude_codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = "${aws_s3_bucket.project_bucket.id}" 
    encryption_key {
      id = aws_kms_key.jude-artifacts-key.arn
      type = "KMS"
    }
  
        
    
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["SourceArtifact"]
      run_order        = 1
      role_arn         = "arn:aws:iam::${var.root_account_id}:role/${var.codecommit_role}"

      configuration = {
        RepositoryName = var.repo_name
        BranchName     = "${var.branch}"
      }
    }
  }


  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      region          = "${var.region}" 
      provider        = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        ProjectName = "${var.codebuild_project_name}"
    
      }
    }
  }
}
