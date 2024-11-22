
# CodeBuild IAM Permissions
data "template_file" "codepipeline_assume_role_policy_template" {
  template = file("${path.module}/iam-policies/codebuild_assume_role.tpl")

}


resource "aws_iam_role" "codebuild_assume_role" {
  name               = "jude-codebuild-role"
  assume_role_policy = data.template_file.codepipeline_assume_role_policy_template.rendered
}


data "template_file" "codebuild_policy_template" {
  template = file("${path.module}/iam-policies/codebuild.tpl")
  vars = {
    artifact_bucket         = var.build_artifact_bucket_arn
    aws_kms_key             = aws_kms_key.artifact_encryption_key.arn
    codebuild_project_build = aws_codebuild_project.build_project.id
  }
}


resource "aws_iam_role_policy" "codebuild_policy" {
  name = "jude-codebuild-policy"
  role = aws_iam_role.codebuild_assume_role.id
  policy = data.template_file.codebuild_policy_template.rendered
}
