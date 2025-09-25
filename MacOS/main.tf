terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
    host = "unix:///Users/<Your_local_user_name>/.colima/default/docker.sock"
}


# Pull nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}

# Run nginx container
resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx.name   # FIX: use .name instead of .latest

  ports {
    internal = 80
    external = 8080
  }
}
