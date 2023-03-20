resource "aws_iam_role" "codecommit-role" {
  name = var.codecommit_role
  lifecycle {
    create_before_destroy = true
  }
   assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Sid    = ""
        Principal = {
           AWS:"arn:aws:iam::${var.destination_account_id}:root"}

        Action = "sts:AssumeRole",
        "Condition": {}
      }
]
   })
}

data "aws_iam_policy_document" "codecommit-policies" {
    statement{
        sid = ""
        actions = ["logs:*", "codecommit:*","codebuild:*", "secretsmanager:*","iam:*"]
        resources = ["*"]
        effect = "Allow"
    }
}

resource "aws_iam_policy" "kms-key-policy" {
    name = "judestella_kms_key_policy"
    lifecycle {
    create_before_destroy = true
  }
    path = "/"
    description = "KMS Key policy for cross account role"
    policy = jsonencode({
         Version= "2012-10-17",
         Statement=[
            {
            "Effect": "Allow",
            "Action": "kms:*"
            "Resource":[
        "arn:aws:kms:${var.crossaccount_kms_arn}"
    ]
        }
]
    })
}

resource "aws_iam_policy" "codecommit-policy" {
    name = var.codecommit_policy
    lifecycle {
    create_before_destroy = true
  }
    path = "/"
    description = "Codecommit policy"
    policy = data.aws_iam_policy_document.codecommit-policies.json
}

resource "aws_iam_role_policy_attachment" "tf-cicd-codecommit-attachment1" {
    policy_arn  = aws_iam_policy.codecommit-policy.arn
    role        = aws_iam_role.codecommit-role.id
}

resource "aws_iam_role_policy_attachment" "tf-cicd-codecommit-attachment2" {
    policy_arn  = "arn:aws:iam::aws:policy/PowerUserAccess"
    role        = aws_iam_role.codecommit-role.id
}
resource "aws_iam_role_policy_attachment" "tf-cicd-codecommit-attachment3" {
    policy_arn  = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
    role        = aws_iam_role.codecommit-role.id
}