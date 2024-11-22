output "kms_arn" {
    value = aws_kms_key.artifact_encryption_key.arn
}

output "code_build_package_arn" {
    value = aws_codebuild_project.build_project.name
}
