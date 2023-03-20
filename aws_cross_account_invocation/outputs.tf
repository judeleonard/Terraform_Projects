output "codecommit_info" {
  value       = module.codecommit
  description = "informations and outputs from code commit deployment"
}

output "codebuild_info" {
  value       = module.codebuild
  description = "informations and outputs from code build deployment"
}

# output "codebuild.s3_logging_bucket_id" {
#     value = module.code

# }