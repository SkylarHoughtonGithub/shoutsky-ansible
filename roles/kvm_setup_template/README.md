# Ansible KVM Role

This role installs and configures KVM (Kernel-based Virtual Machine) virtualization on Linux systems.

## Requirements

- Linux host with CPU virtualization support (Intel VT-x or AMD-V)
- Ansible 2.9 or higher
- Root privileges on target hosts

## Role Variables

```yaml
# defaults/main.yml
kvm_packages:
  - qemu-kvm
  - libvirt-daemon
  - libvirt-clients
  - bridge-utils
  - virt-manager
  - cockpit
  - cockpit-machines
```

## Dependencies

None.

## Example Playbook

```yaml
- hosts: virtualization_hosts
  become: true
  roles:
    - kvm
```

## Usage

1. Include this role in your playbook
2. Run the playbook: `ansible-playbook -i inventory playbook.yml`
3. Access Cockpit web interface at https://server-ip:9090

## License

MIT

## Author Information

Skylar Houghton