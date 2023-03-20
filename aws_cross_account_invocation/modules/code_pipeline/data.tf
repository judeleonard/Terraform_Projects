data "aws_caller_identity" "current" {}

data "aws_kms_key""jude-artifacts-key"{
    key_id = aws_kms_key.jude-artifacts-key.id
}