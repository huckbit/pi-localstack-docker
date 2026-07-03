resource "docker_volume" "portainer" {
  name = "portainer-volume"
}

resource "docker_image" "portainer" {
  name         = "portainer/portainer-ce:latest"
  keep_locally = true
}

resource "docker_container" "portainer_pi" {
  name    = "portainer"
  image   = docker_image.portainer.image_id
  restart = "unless-stopped"

  ports {
    internal = 9000
    external = 9000
  }

  # Host path mount for Docker socket
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

}