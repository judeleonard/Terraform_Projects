## This project deploys a custom lambda function to an aws destination account using aws codepipeline.

## How it works

codecommit is deployed to aws csc account and the codepipeline deploys the custom lambda function to another aws target account. The backend is bootstrapped using 
S3 for storing terraform tfstate. 

### Commands to run:
        
        - terraform init

        - terraform fmt

        - terraform validate

        - terraform plan --var-file=filename.tfvars

        - terraform apply --var-file=filename.tfvars --auto-approve


### Build Phases

![](https://github.com/judeleonard/Terraform_Projects/blob/dev/lambda_function/image/buildspec_stages.png)

### Pipeline demo

![](https://github.com/judeleonard/Terraform_Projects/blob/dev/lambda_function/image/lambda_pipeline.png)