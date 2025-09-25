terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Docker provider for Linux (default Unix socket)
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Run nginx container
resource "docker_container" "nginx" {
  name  = "nginx-server"
  image = docker_image.nginx.latest
  ports {
    internal = 80
    external = 8080
  }
}

# Optional: build local Dockerfile (if you have one)
# resource "docker_image" "my_app" {
#   name = "my-app:latest"
#   build {
#     context    = "/home/ubuntu/projects/myapp"  # Linux-style path
#     dockerfile = "/home/ubuntu/projects/myapp/Dockerfile"
#   }
# }
