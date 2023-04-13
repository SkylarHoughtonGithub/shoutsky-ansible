<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_vars"></a> [network\_vars](#input\_network\_vars) | n/a | `map(string)` | <pre>{<br>  "mtu": "1500",<br>  "name": "homelab-network"<br>}</pre> | no |
| <a name="input_subnet_vars"></a> [subnet\_vars](#input\_subnet\_vars) | n/a | `map(string)` | <pre>{<br>  "cidr": "10.0.10.0/24",<br>  "name": "homelab-subnet",<br>  "region": "us-central1"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | n/a |
<!-- END_TF_DOCS -->