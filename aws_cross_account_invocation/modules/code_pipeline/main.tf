provider "aws" {
  access_key = var.aws_access_key_2
  secret_key = var.aws_secret_key_2
  region = var.region
}


# create the pipeline 
resource "aws_codepipeline" "codepipeline" {
  name     = var.tf_code_pipeline_name
  role_arn = aws_iam_role.jude_codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.tf_codepipeline_artifact_bucket.id
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
      role_arn= "arn:aws:iam::${var.root_account_id}:role/${var.codecommit_role}"

      configuration = {
        RepositoryName = var.code_commit_name
        BranchName       = "main"
      }
    }
  }


  stage {
    name = "Terraform-Apply"

    action {
      name            = "Terraform-Apply"
      category        = "Build"
      owner           = "AWS"
      region          = "${var.region}" 
      provider        = "CodeBuild"
      input_artifacts = ["SourceArtifact"]
      output_artifacts = ["BuildArtifact"]
      version         = "1"

      configuration = {
        ProjectName = var.codebuild_project_terraform_apply_name
      
      }
    }
  }
}
