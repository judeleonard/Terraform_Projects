
# create codepipeline role
resource "aws_iam_role" "jude_codepipeline_role" {
  name = var.tf_codepipeline_role_name 

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "jude_codepipeline_policy" {                                                 
  name = var.tf_codepipeline_role_policy_name
  role = aws_iam_role.jude_codepipeline_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObjectAcl",
        "s3:PutObject"
      ],
      "Resource": [
        "${aws_s3_bucket.s3_bucket_logs.arn}",
        "${aws_s3_bucket.s3_bucket_logs.arn}/*",
        "${aws_s3_bucket.tf_codepipeline_artifact_bucket.arn}",
        "${aws_s3_bucket.tf_codepipeline_artifact_bucket.arn}/*"
      ]
    },

    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    },

    {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": "arn:aws:iam::${var.root_account_id}:role/*"
      }
  ]
}
EOF
}
