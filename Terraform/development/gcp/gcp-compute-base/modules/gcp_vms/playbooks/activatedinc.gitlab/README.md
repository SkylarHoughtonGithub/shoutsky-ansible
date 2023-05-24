# gitlab

Runs gitlab on Docker. Supports http and https.

## Requirements

### Docker

Requires `docker` and `docker-py`. This can be fulfilled through the following
Ansible roles:

``` yaml
- name: Converge
  hosts: all
  become: yes
  vars:
    pip_install_packages:
      - name: docker
  roles:
    - geerlingguy.pip
    - geerlingguy.docker

```

### SSL Certificates

To use SSL, first copy your cert and key to the path on the host specified by
the `gitlab_ssl_cert_path` and `gitlab_ssl_key_path`.

## Role Variables

| Name | Default | Description |
| --- | --- | --- |
| gitlab_user | gitlab | User to create |
| gitlab_base_path | /var/lib/gitlab | Base path for gitlab subdirectories |
| gitlab_data_path | "{{ gitlab_base_path }}/data" | Location of data on the host |
| gitlab_logs_path | "{{ gitlab_base_path }}/logs" | Location of logs on the host |
| gitlab_config_path | {{ gitlab_base_path }}/config" | Location of configuration on the host |
| gitlab_ssl_path | {{ gitlab_base_path }}/config" | Location of ssl on the host |
| gitlab_external_url | http://localhost | External URL |
| gitlab_docker_image | gitlab/gitlab-ce:11.2.0-ce.0 | Gitlab image to run |
| gitlab_http_enabled | false | If http is enabled |
| gitlab_http_host_port | 8080 | HTTP port published on host |
| gitlab_https_enabled | true | If https is enabled |
| gitlab_https_host_port | 8443 | HTTPS port published on host |
| gitlab_ssh_enabled | false | If ssh is enabled |
| gitlab_ssh_host_port | 2222 | SSH port published on host |
| gitlab_ssl_cert_path | "/certs/gitlab.crt" | Relative path to cert |
| gitlab_ssl_key_path | "/private/gitlab.key | Relative path to key |

## Dependencies

None

## Example Playbook

HTTP only with HTTPS reverse-proxy:

``` yaml
---
- name: Converge
  hosts: all
  become: true
  vars:
    pip_install_packages:
      - name: docker
    gitlab_external_url: https://mysite
    gitlab_http_enabled: true 
    gitlab_https_enabled: false 
  roles:
    - geerlingguy.pip
    - geerlingguy.docker
    - ansible-role-gitlab
```

HTTPS only. Cert and keys must be copied first.

``` yaml
---
- name: Converge
  hosts: all
  become: true
  vars:
    pip_install_packages:
      - name: docker
    gitlab_external_url: https://mysite
  pre_tasks:
    - name: Create gitlab user
      user:
        name: gitlab
        state: present
  roles:
    - geerlingguy.pip
    - geerlingguy.docker
    - ansible-role-gitlab
```

## License

MIT

## Author Information

Ben Tomasini, Activated, Inc. - [btomasini@activated.io](mailto:btomasini@activated.io)
