# create s3 bucket for storing logs
resource "aws_s3_bucket" "s3_bucket_logs" {
  bucket = var.s3_logging_bucket
  #acl    = "private"
}

# create s3 bucket for storing codepipeline artifacts
resource "aws_s3_bucket" "tf_codepipeline_artifact_bucket" {
  bucket = var.tf_codepipeline_artifact_bucket_name
  versioning {
    enabled = true  
  }
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1591079668806",
  "Statement": [
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${var.root_account_id}:root"
          },
          "Action": [
              "s3:Get*",
              "s3:Put*"
          ],
          "Resource": "arn:aws:s3:::${var.tf_codepipeline_artifact_bucket_name}/*"
      },
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${var.root_account_id}:root"
          },
          "Action": "s3:ListBucket",
          "Resource": "arn:aws:s3:::${var.tf_codepipeline_artifact_bucket_name}"
      }
  ]
}
POLICY 
}