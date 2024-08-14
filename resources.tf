# Create a new SSH key
resource "hcloud_ssh_key" "main" {
  name       = "SSH Key"
  public_key = file(var.ssh_key_pub)
}

# Create a new server running debian
resource "hcloud_server" "main" {
  name        = "tailscale-xn-001"
  image       = "debian-12"
  server_type = "cx22"
  location    = "hel1"

  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  ssh_keys = [
    hcloud_ssh_key.main.id
  ]

  firewall_ids = [hcloud_firewall.tailscale.id]

  user_data = <<-EOT
  #cloud-config
  runcmd:
    # https://tailscale.com/download/linux/debian-bookworm
    - curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
    - curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list
    - sudo apt-get update -y
    - sudo apt-get install tailscale -y
    # https://tailscale.com/kb/1103/exit-nodes/#configuring-an-exit-node
    - echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
    - echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
    - sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
    - sudo tailscale up --ssh --advertise-exit-node --authkey=${var.tailscale_key}
  EOT
}

resource "hcloud_firewall" "tailscale" {
  name = "only-tailscale"

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "3478"
    source_ips = [
      "100.64.0.0/10"
    ]
  }

  rule {
    direction = "in"
    protocol  = "udp"
    port      = "80-85"
    source_ips = [
      "100.64.0.0/10"
    ]
  }
}
