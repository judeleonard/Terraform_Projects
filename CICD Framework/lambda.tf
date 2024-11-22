
# data "archive_file" "archive" {
#     type = "zip"
#     source_file = "${path.module}/lambda_code"
#     output_path = "${path.module}/lambda_src.zip"
# }

#achive directory to the lambda function
resource "null_resource" "lambda_src_archive" {
    provisioner "local-exec" {
        command = "zip -r ${path.module}/lambda_src.zip ${path.module}/lambda_code"
    }
}

#upload zip to s3 and then update lamda function from s3

resource "aws_s3_bucket_object" "file_upload" {
  bucket = "${var.project_bucket_id}"
  key    = "${var.repo_name}/lambda_src.zip"
  source = "${path.module}/lambda_src.zip"                       
}

# define lambda function
resource "aws_lambda_function" "jude_lambda_test" {
  filename         = "BuildArtifact/output_lambda_src.zip"
  function_name = "function"
  role          = aws_iam_role.lambda_role.arn    
  handler       = "function.hello"
  runtime       = "python3.8"
 # s3_bucket     = "${var.project_bucket_id}"
  #s3_key        = "${aws_s3_bucket_object.file_upload.key}"
  memory_size = 1024
  timeout     = 900
  timeouts {
  create = "30m"
  }

}

resource "null_resource" "commit_files" {
  provisioner "local-exec" {
    command = <<-EOT
      cd "${path.module}"
      git config --global init.defaultBranch ${var.branch}
      git init
      git add lambda_code
      git commit -m 'added lambda_code'
      git push https://git-codecommit.us-east-1.amazonaws.com/v1/repos/${var.repo_name} --all
    EOT
  }
}


