# OKD Deployment Guide using KubeInit

This guide implements [KubeInit](https://github.com/Kubeinit/kubeinit), originally developed by Carlos Camacho and the KubeInit contributors.
Licensed under the Apache License, Version 2.0.

## Prerequisites

- A RHEL/CentOS 8+ server with sufficient resources:
  - 4+ CPU cores per control node
  - 4+ CPU cores per compute node
  - 16GB+ RAM per control node
  - 16GB+ RAM per compute node
  - 500GB+ available storage
  - Hardware virtualization support (VT-x/AMD-V)

## Setup

1. Install Ansible requirements:
```bash
ansible-galaxy install -r requirements.yml
```

2. Create inventory file (hosts.ini):
```ini
[okd]
kvm1 ansible_host=192.168.1.10
```

3. Populate host vars (host_vars/okd-host.yml)
```yaml
# Cluster configuration
cluster_name: myokd
cluster_domain: example.com

# Node configuration
control_node_count: 3
compute_node_count: 2  # Adjust number of worker nodes here
service_node_count: 1

# Resource allocation (per node)
control_node_memory: 16384
control_node_vcpus: 4
compute_node_memory: 16384
compute_node_vcpus: 4
service_node_memory: 8192
service_node_vcpus: 2

# Network configuration
network_cidr: 10.0.0.0/24 
pod_cidr: 10.100.0.0/16
service_cidr: 172.30.0.0/16

# OKD version
okd_version: 4.12
```

4. Run the deployment:
```bash
ansible-playbook -i inventory.ini deploy-okd.yml
```

## Customizable Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `cluster_name` | Name of the OKD cluster | okd |
| `cluster_domain` | Domain for cluster URLs | kubeinit.local |
| `control_node_count` | Number of control plane nodes | 3 |
| `compute_node_count` | Number of worker nodes | 2 |
| `service_node_count` | Number of service nodes | 1 |
| `control_node_memory` | Memory (MB) for control nodes | 16384 |
| `control_node_vcpus` | vCPUs for control nodes | 4 |
| `compute_node_memory` | Memory (MB) for compute nodes | 16384 |
| `compute_node_vcpus` | vCPUs for compute nodes | 4 |
| `service_node_memory` | Memory (MB) for service nodes | 8192 |
| `service_node_vcpus` | vCPUs for service nodes | 2 |
| `network_cidr` | CIDR for VM network | 10.0.0.0/24 |
| `pod_cidr` | CIDR for Kubernetes pods | 10.100.0.0/16 |
| `service_cidr` | CIDR for Kubernetes services | 172.30.0.0/16 |
| `okd_version` | OKD version to deploy | 4.12 |

## Storage Configuration

KubeInit configures storage automatically, but you can customize:

- Default storage path: `/var/lib/libvirt/images`
- Temporary storage for ISO images: `/var/lib/libvirt/images/kubeinit`

## Networking

KubeInit creates:
- Virtual bridge for VM networking
- DNS for cluster resolution
- Load balancer for API and ingress traffic

The pod_cidr and service_cidr don't need to be linked to your real network. They're internal to the OKD cluster and won't communicate directly with your physical network. The KubeInit-created bridge will form an isolated network for the VMs, and routing between your physical network and the VM network will be handled by the host

## Access

After deployment (approx. 30-45 minutes):
- Console: https://console-openshift-console.apps.CLUSTER_NAME.CLUSTER_DOMAIN
- API: https://api.CLUSTER_NAME.CLUSTER_DOMAIN:6443
- Default admin credentials: kubeadmin / (generated password shown in deployment logs)

## Troubleshooting

Common issues:
1. Insufficient resources - Check CPU, RAM, and storage
2. Virtualization not enabled - Verify VT-x/AMD-V is enabled in BIOS
3. Network conflicts - Ensure CIDRs don't conflict with existing networks
4. Timeouts - Deployment can take 45+ minutes, be patient

Logs location:
- KubeInit logs: `/var/log/kubeinit/`
- Libvirt logs: `/var/log/libvirt/`

## References

- [KubeInit GitHub Repository](https://github.com/Kubeinit/kubeinit)
- [OKD Documentation](https://docs.okd.io/)
- [KubeInit Documentation](https://kubeinit.github.io/kubeinit/)