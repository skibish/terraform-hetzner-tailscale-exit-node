variable "hcloud_token" {
  description = "Hetzner Cloud Read & Write token (https://console.hetzner.cloud/projects/:project_id/security/tokens)."
  type        = string
}

variable "tailscale_key" {
  description = "Tailscale Auth Key (https://login.tailscale.com/admin/settings/keys)."
  type        = string
}

variable "ssh_key" {
  description = "Path to SSH Key file (e.g. $HOME/.ssh/id)."
  type        = string
}

variable "ssh_key_pub" {
  description = "Path to SSH Public Key file (e.g. $HOME/.ssh/id.pub)."
  type        = string
}
