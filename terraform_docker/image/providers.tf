terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.15.0"
    }
  }

}

# this section below is not neccessary as its already inherited by the parents directory
# provider "docker" {}