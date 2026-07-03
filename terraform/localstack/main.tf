resource "docker_volume" "localstack" {
  name = "localstack-volume"
}

resource "docker_image" "localstack" {
  name         = "localstack/localstack:latest"
  keep_locally = true
}

resource "docker_container" "localstack_pi" {
  name    = "localstack"
  image   = docker_image.localstack.image_id
  restart = "unless-stopped"

  ports {
    internal = 4566
    external = 4566
  }

  env = [
    "LOCALSTACK_AUTH_TOKEN=${var.localstack_auth_token}",
    "DEBUG=0",
  ]

  # Named volume for LocalStack data
  volumes {
    volume_name    = docker_volume.localstack.name
    container_path = "/var/lib/localstack"
  }

  # Host path mount for Docker socket
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }

}