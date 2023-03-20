
# output "ip-address" {
#   value       = flatten(module.container[*].ip-address)  # compress each of the container's ip_address into a single list rather than having them on separate list. Hence we use the flatten function
#   description = "The IP Address of the container"
#   # sensitive = true
# }

# output "container-name" {
#   value = module.container[*].container-name
#   description = "The name of the container"
# }

output "application_access" {
    value = module.container
    description = "the name and socket for each application"
}
# --------------------------------------------------------------------------#
# output "ip-address2" {
#    value = join(":", [docker_container.nodered_container[1].ip_address, docker_container.nodered_container[1].ports[0].external])
#    description = "The IP Address of the container"
#}

# output "container-name2" {
#    value = docker_container.nodered_container[1].name
#    description = "The name of the container"
# }