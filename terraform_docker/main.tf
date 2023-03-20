terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }

}
provider "docker" {}

# ::::::::::::::::::::::::::: COMMENT :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#-- removing the local exec resource as it is redundant and not the recommended way to mount a docker volume using terraform-----
# we also remove the depends on attribute we have attached when creating our container. the reason for this is that we need to mount
# a volume directly attached to our container module in the main.tf so that once the container is destroyed, the volume gets destroyed as well, vice versa
# 

# resource "null_resource" "dockervol" {
#     provisioner "local-exec" {
#         command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/" 
#     }
# }

# we create a module here to reference a resource in the image folder
# resource "docker_image" "nodered_image" {
#   #name = "nodered/node-red:latest"
#   name = lookup(var.image, terraform.workspace)
# }
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# here we want to create a second image like a DB(influxDB) where we want to ingest any data we are going to be pulling fro nodered
# in this case we will have to rename our image module name to something else other than "image" as the name so we can have 
# different images created as modules 
# Note: this influx DB should also be created from within the image module directory

# :::::::::::::::::::::::::::::::: COMMENT :::::::::::::::::::::::::::::::::::::::::::::
# locals can be used to store values and keys for_each function. in this case we can deploy two containers using just one image resource/module


module "image" {
    source = "./image"
    for_each = local.deployment
    image_in = each.value.image          #var.image["nodered"][terraform.workspace]
}



module "container" {
   source = "./container"
   count_in = each.value.container_count
#    depends_on = [
#      null_resource.dockervol
#    ]
   for_each = local.deployment
  # count = local.container_count
   name_in  =  each.key
   # image = docker_image.nodered_image.latest
   image_in = module.image[each.key].image_out
   int_port_in = each.value.int
   ext_port_in = each.value.ext
   container_path_in = each.value.container_path
   #host_path_in = "${path.cwd}/noderedvol"
   
}
