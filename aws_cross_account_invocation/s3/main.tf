provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "${var.region}"
}

resource "aws_s3_bucket" "jude-project-bucket" {
    bucket = "${var.bucket_name}" 
    acl = "${var.acl_value}" 
    tags = {
        Name = "jude-bucket"
  }  
}

module "s3-bucket" {
    source  = "terraform-aws-modules/s3-bucket/aws"
    version = "3.6.0"
    #bucket name should be unique
    #bucket_name = "${var.bucket_name}"       
}
