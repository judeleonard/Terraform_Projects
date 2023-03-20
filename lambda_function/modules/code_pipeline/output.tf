output "project_bucket_name" {
  value = aws_s3_bucket.project_bucket.bucket 
}

output "project_bucket_arn" {
  value = aws_s3_bucket.project_bucket.arn
}

output "project_bucket_id" {
  value = aws_s3_bucket.project_bucket.id
}
# output "artifact_location" {
#   value = aws_s3_bucket_object.pipeline_artifact.key
# }
output "kms_arn" {
  value= data.aws_kms_key.jude-artifacts-key.arn
}

output "lambda_cross_role_name" {
  value = aws_iam_role.jude_codepipeline_role.name  
}