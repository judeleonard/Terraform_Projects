{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "Stmt163546987325",
        "Action": "logs:*",
        "Effect": "Allow",
        "Resource": "*"
      },
      
      {
        "Effect": "Allow",
        "Action": [
            "lambda:CreateFunction"
        ],
        "Resource": "*"
      },

      {
        "Effect": "Allow",
        "Action": "iam:PassRole",
        "Resource": "*",
        "Condition": {
            "StringEquals": {
                "iam:PassedToService": "lambda.amazonaws.com"
            }
        }
        },

      {
        "Effect": "Allow",
        "Action": "sts:AssumeRole",
        "Resource": "arn:aws:iam::${destination_account_id}:role/${tf_codepipeline_role_name}"
      }
    ]
  }


