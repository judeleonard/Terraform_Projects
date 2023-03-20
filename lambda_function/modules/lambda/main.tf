provider "aws" {
  access_key = var.target_access_key
  secret_key = var.target_secret_key
  region = var.region  
}


resource "null_resource" "commit_files" {
  provisioner "local-exec" {
    command = <<-EOT
      cd ../..
      git config --global init.defaultBranch ${var.branch}
      git init
      git add lambda_code
      git commit -m 'added lambda_code'
      git push https://git-codecommit.us-east-1.amazonaws.com/v1/repos/${var.repo_name} --all
    EOT
  }
}


