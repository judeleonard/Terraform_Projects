resource "aws_kms_key" "jude-artifacts-key" {
  description = "cross account Key"
  policy = data.aws_iam_policy_document.kms-usage.json
 
}