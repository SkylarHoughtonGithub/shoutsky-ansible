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
| [google_compute_instance.instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | n/a | `map(string)` | <pre>{<br>  "centos7": "centos-cloud/centos-7",<br>  "cos97lts": "cos-cloud/cos-97-lts",<br>  "debian11": "debian-cloud/debian-11",<br>  "rocky8": "rocky-linux-cloud/rocky-linux-8-optimized-gcp",<br>  "rocky9": "rocky-linux-cloud/rocky-linux-9-optimized-gcp",<br>  "winserver2019": "windows-cloud/windows-2019"<br>}</pre> | no |
| <a name="input_instance_vars"></a> [instance\_vars](#input\_instance\_vars) | n/a | `map(string)` | <pre>{<br>  "machine_type": "e2-small",<br>  "name": "rocky9-web1",<br>  "subnet_id": "homelab-subnet",<br>  "zone": "us-central1-c"<br>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list` | <pre>[<br>  "web",<br>  "bastion",<br>  "default"<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->