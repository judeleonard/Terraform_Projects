terraform {
  backend "s3" {
    bucket  =  "jude-demo-bucket" 
    key     = "d2b-in-tjude/terraform.tfstate"       
    region  = "us-east-1"                            
    profile = "default"
  }
}


