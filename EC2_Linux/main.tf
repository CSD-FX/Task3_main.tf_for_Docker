  # host = "unix:///Users/<your-username>/.colima/default/docker.sock"

  # Windows + Docker Desktop
  # host = "npipe:////./pipe/docker_engine"

  # Linux / macOS Docker Desktop
  # host = "unix:///var/run/docker.sock"
}

# ----------------------------
# Pull Nginx Docker image
# ----------------------------
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# ----------------------------
# Run Nginx container
# ----------------------------
resource "docker_container" "nginx_container" {
  name  = "my-nginx"
  image = docker_image.nginx.name   # <-- use .name, NOT .latest

  ports {
    internal = 80
    external = 3000
  }
}

-- INSERT --                                                                                                                     47,19         Bot
