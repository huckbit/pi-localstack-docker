output "container_name" {
  description = "Name of the LocalStack container on the Pi"
  value       = docker_container.localstack_pi.name
}

output "container_id" {
  description = "ID of the LocalStack container"
  value       = docker_container.localstack_pi.id
}

output "localstack_endpoint" {
  description = "LocalStack gateway endpoint"
  value       = "http://${var.pi_host}:4566"
}

output "volume_name" {
  description = "Docker volume used for LocalStack persistence"
  value       = docker_volume.localstack.name
}