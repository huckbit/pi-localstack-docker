variable "pi_host" {
  description = "IP address or hostname of the Raspberry Pi"
  type        = string

  validation {
    condition     = can(regex("^(\\d{1,3}\\.){3}\\d{1,3}$", var.pi_host))
    error_message = "pi_host must be a valid IPv4 address."
  }
}

variable "localstack_auth_token" {
  description = "LocalStack auth token"
  type        = string
  sensitive   = true
}