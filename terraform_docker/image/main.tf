resource "docker_image" "container_image" {
  name = var.image_in
 # name = lookup(var.image, terraform.workspace)
}
