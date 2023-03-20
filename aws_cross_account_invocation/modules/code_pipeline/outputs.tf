output "s3_logging_bucket_id" {
  value = aws_s3_bucket.s3_bucket_logs.id
}

output "s3_logging_bucket" {
  value = aws_s3_bucket.s3_bucket_logs.bucket
}

output "crossaccount_kms_arn" {
  value= data.aws_kms_key.jude-artifacts-key.arn
}

output "tf_codepipeline_artifact_bucket_name" {
  value = aws_s3_bucket.tf_codepipeline_artifact_bucket.bucket  
}

output "tf_codepipeline_artifact_bucket_arn" {
  value = aws_s3_bucket.tf_codepipeline_artifact_bucket.arn
}

output "codepipeline_bucket_id" {
  value = aws_s3_bucket.tf_codepipeline_artifact_bucket.id

}