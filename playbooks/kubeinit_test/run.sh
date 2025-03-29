#! /bin/bash
ansible-playbook \
    -v --user ansible \
    -e kubeinit_spec=okd-libvirt-3-2-1 \
    -e hypervisor_hosts_spec='[{"ansible_host":"192.168.88.252","name":"kvm1"}]' \
    -e @custom_spec.yml \
    ./ansible_collections/kubeinit/kubeinit/playbook.yml