# grant policy access to project bucket
resource "aws_s3_bucket" "project_bucket" {
  bucket = var.bucket
  tags = {
    Name        = "My bucket"
    Environment = "${var.branch}"
  }
  force_destroy = "true"
  versioning {
    enabled = true  
  }
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy1591079667846",
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
          "Resource": "arn:aws:s3:::${var.bucket}/*"
      },
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${var.root_account_id}:root"
          },
          "Action": "s3:ListBucket",
          "Resource": "arn:aws:s3:::${var.bucket}"
      },
      {
          "Sid": "AllowAllS3ActionsInUserFolder",
          "Effect": "Allow",
          "Principal": {
              "AWS": "arn:aws:iam::${var.root_account_id}:root"
          },
          "Action": ["s3:*"],
          "Resource": ["arn:aws:s3:::${var.bucket}/*"]
      }
  ]
}
POLICY 
}
