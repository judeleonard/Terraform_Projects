data "aws_iam_policy_document" "lambda_assume_policy" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name  =  "${var.lambda_role}"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_policy.json
}

data "template_file" "lambda_policy_template" {
  template = file("${path.module}/IAM/lambda_policy.tpl")
  vars = {
    destination_account_id = var.destination_account_id
    tf_codepipeline_role_name = var.tf_codepipeline_role_name
  }
} 

resource "aws_iam_role_policy" "lambda_policy" {
  name = var.lambda_assumedPolicy  
  role = aws_iam_role.lambda_role.id

  policy = data.template_file.lambda_policy_template.rendered

}
