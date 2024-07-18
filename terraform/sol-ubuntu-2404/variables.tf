# --- Vault ---
variable "vault_url" {
  type    = string
  default = "https://vault.browningluke.dev"
}

variable "vault_approle_role_id" {
  type = string
}

variable "vault_approle_secret_id" {
  type = string
}

/* Proxmox */
variable "pve_id" {
  type        = number
  description = "value"
}

variable "pve_node" {
  type        = string
  description = "description"
}

variable "pve_host" {
  type        = string
  description = "description"
}

variable "pve_port" {
  type    = string
  default = "8006"
}

variable "pve_https" {
  type    = bool
  default = true
}
