terraform {
  backend "s3" {
    bucket  =  "jude-lambda-bucket" 
    key     = "terraform.tfstate"       
    region  = "us-east-1"                            
    profile = "default"
  }
}
