terraform {
  required_version = ">=1.12.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "ssh://pi@${var.pi_host}"

  ssh_opts = ["-i", "~/.ssh/hb-pi4b", "-o", "StrictHostKeyChecking=no"]
}