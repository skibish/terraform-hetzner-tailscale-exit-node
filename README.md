# Tailscale Exit Node provisioning in Hetzner Cloud

This is an example of how Tailscale Exit Node can be provisioned in Hetzner Cloud with help of the Terraform.

Docs are generated with:

```sh
terraform-docs markdown table --output-file README.md --output-mode inject .
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | ~> 1.45 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | ~> 1.45 |
| <a name="provider_hetzner"></a> [hetzner](#provider\_hetzner) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.tailscale](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/firewall) | resource |
| [hcloud_server.main](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hetzner_ssh_key.main](https://registry.terraform.io/providers/hashicorp/hetzner/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hcloud_token"></a> [hcloud\_token](#input\_hcloud\_token) | Hetzner Cloud Read & Write token (https://console.hetzner.cloud/projects/:project_id/security/tokens). | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Path to SSH Key file (e.g. $HOME/.ssh/id). | `string` | n/a | yes |
| <a name="input_ssh_key_pub"></a> [ssh\_key\_pub](#input\_ssh\_key\_pub) | Path to SSH Public Key file (e.g. $HOME/.ssh/id.pub). | `string` | n/a | yes |
| <a name="input_tailscale_key"></a> [tailscale\_key](#input\_tailscale\_key) | Tailscale Auth Key (https://login.tailscale.com/admin/settings/keys). | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
