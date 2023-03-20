
# define aws iam role for codebuild cross account
resource "aws_iam_role" "jude_codebuild_iam_role_crossacount" {
  name = "JudecrossAccountRole"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.root_account_id}:root"
      },
      "Action": "sts:AssumeRole",
      "Condition": {}
    }
  ]
}
EOF

  tags = {
    Environment = "Test"
  }
}

resource "aws_iam_policy" "tf_iam_assumed_policy" {
  name = var.tf_iam_assumedPolicy       

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowAllPermissions",
      "Effect": "Allow",
      "Action": [
        "*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach IAM assume role to policy
resource "aws_iam_role_policy_attachment" "tf_iam_attach_assumed_role_to_permissions_policy" {
  role       = aws_iam_role.jude_codebuild_iam_role_crossacount.name
  policy_arn = aws_iam_policy.tf_iam_assumed_policy.arn
}

# Create an IAM role codebuild service
resource "aws_iam_role" "codebuild_iam_role" {
  name = var.codebuild_iam_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "jude_codebuild_iam_role_policy" {
  role = aws_iam_role.codebuild_iam_role.name


  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },
    
    {
      "Effect": "Allow",
      "Action": [
        "codecommit:BatchGet*",
        "codecommit:BatchDescribe*",
        "codecommit:Describe*",
        "codecommit:EvaluatePullRequestApprovalRules",
        "codecommit:Get*",
        "codecommit:List*",
        "codecommit:GitPull"
      ],
      "Resource": ["*"]
    },

    {
      "Effect": "Allow",
      "Action": [
        "iam:Get*",
        "iam:List*"
      ],
      "Resource": ["*"]
    },

    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": ["*"]        
    },

    {
      "Effect": "Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "arn:aws:s3:::codepipeline-us-east-1*",
        "arn:aws:s3:::codepipeline-us-east-1*/*",
        "${var.tf_codepipeline_artifact_bucket_arn}",
        "${var.tf_codepipeline_artifact_bucket_arn}/*"   
      ]
    }
  ]
}
POLICY
}