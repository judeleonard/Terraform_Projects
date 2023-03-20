code_commit_name  = "demo-jude-repo"
code_commit_desc  = "jude capstone project first code commit"
bucket_name       = "jude-capstone-demo-terraform-tfstate"
s3_logging_bucket =  "jude-capstone-logs"                  
key               = "d2b-in-tjude/terraform.tfstate"
state_bucket_arn  = "arn:aws:s3:::jude-capstone-demo-terraform-tfstate"
codecommit_role   = "judecodecommit_role"
codecommit_policy = "judestellacodecommit_policy"

# IAM config
aws_access_key = "AKIA2FLDO5XMO3NX4RUL"                                   
aws_secret_key = "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"
acl_value      = "private"
region         = "us-east-1"
profile        = "default"

# # IAM Config 2                                                

############################################################3333
aws_access_key_2 = "AKIAZNTDB74KHRE7CNCC"
aws_secret_key_2 = "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"
acl_value_2      = "private"

# code build config
codebuild_iam_role_name                = "JudeCodeBuildIamRole"
codebuild_iam_role_policy_name         = "CodeBuildPolicy"
codebuild_project_terraform_plan_name  = "JudeTerraformCode_buildProject_plan"
codebuild_project_terraform_apply_name = "JudeTerraformCode_buildProject_apply"
tf_iam_assumedRole                     = "TerraformAssumedIamRolee"
tf_iam_assumedPolicy                   = "JudeTerraformAssumedIamPolicy"

# code pipeline config
tf_codepipeline_name                 = "JudeTerraformCode_pipeline_name"
tf_codepipeline_artifact_bucket_name = "jude-capstone-artifact-bucket"          
tf_codepipeline_role_name            = "JudeCodePipelineIamRole"
tf_codepipeline_role_policy_name     = "TerraformCodePipelineIamRolePolicy"
