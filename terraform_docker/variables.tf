# variable "env" {
#     type = string
#     default = "dev"
#     description = "Environment to deploy to"

# # We can also discard not having to specify the env where to
# # deploy any infrastructure since we can use terraform to create a
# # workspace as either dev or prod and deploy all infrastructure in
# # any of them so that in this way we don't have to always specify which 
# # branch we want to run our infrastructures on. The reccommended way
# # is to switch between branches while running any operation using terraform commands
  
# }

variable "image" {
    type = map
    description = "image for container"
    default = {
    nodered = {
        dev = "nodered/node-red:latest"
        prod = "nodered/node-red:latest-minimal"
    }
    influxdb = {
        dev = "quay.io/influxdb/influxdb:v2.0.2"
        prod = "quay.io/influxdb/influxdb:v2.0.2"
    }  
    grafana = {
        dev = "grafana/grafana"
        prod = "grafana/grafana"
    }
}
}

variable "ext_port" {
  type = map(any)
#   validation {
#     condition = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
#     error_message = "The external port must be in the valid port range 0 - 65535."
#   }

#   validation {
#     condition = max(var.ext_port["prod"]...) < 1980 && min(var.ext_port["prod"]...) >= 1880
#     error_message = "The external port must be in the valid port range 0 - 65535."
#   }
}

# variable "int_port" {
#   type    = number
#   validation {
#   condition = var.int_port == 1880
#   error_message = "The internal port must be equal to 1880."
#   }
# }

variable "container_count" {
  type    = number
  default = 3
}

# locals {
#     container_count = length(lookup(var.ext_port, terraform.workspace))
# }