resource "aws_codecommit_repository" "example_repo" {
    repository_name = "lambda-repo"
    description = "lambda-repo repository"
    default_branch = "main"
}

data "template_file" "buildspec" {
  template = file("${path.module}/buildspec.yaml")
}

resource "null_resource" "example" {
    provisioner "local-exec" {
        command = "mkdir buildspec && echo '${data.template_file.buildspec.rendered}' > buildspec/buildspec.yaml && cd buildspec && git config --global init.defaultBranch main && git init && git add . && git commit -m 'Initial Commit' && git push https://git-codecommit.us-east-1.amazonaws.com/v1/repos/${aws_codecommit_repository.example_repo.repository_name} --all"
    }
}