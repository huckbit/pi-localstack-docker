output "container_name" {
  description = "Name of the Portainer container on the Pi"
  value       = docker_container.portainer_pi.name
}

output "container_id" {
  description = "ID of the Portainer container"
  value       = docker_container.portainer_pi.id
}

output "portainer_endpoint" {
  description = "Portainer web UI endpoint"
  value       = "http://${var.pi_host}:9000"
}

output "volume_name" {
  description = "Docker volume used for Portainer persistence"
  value       = docker_volume.portainer.name
}

output "pi_host" {
  description = "Pi host being targeted"
  value       = var.pi_host
}