## This project deploys a custom lambda function to an aws destination account using aws codepipeline which can also be version controlled by Terraform.

### Commands to run:

        - terraform fmt

        - terraform validate

        - terraform plan --var-file=filename.tfvars

        - terraform apply --var-file=filename.tfvars --auto-approve

### Pipeline demo

![](https://github.com/judeleonard/Terraform_Projects/blob/dev/lambda_function/image/lambda_pipeline.png)