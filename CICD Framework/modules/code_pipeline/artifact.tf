resource "aws_s3_bucket" "build_artifact_bucket" {
  bucket = "my-tf-jude-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
  force_destroy = "true"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.build_artifact_bucket.id
  acl    = "private"
}