# Ansible Environment Configuration

This document explains how to use the environment-based configuration for running Ansible playbooks in this repository.

## Setup

### Prerequisites

- Install direnv
  ```bash
  sudo dnf install direnv #RHEL
  # OR
  sudo apt-get install direnv   # Ubuntu/Debian
  # OR
  brew install direnv          # macOS
  ```

- Add direnv hook to your shell (add to ~/.bashrc or ~/.zshrc)
  ```bash
  eval "$(direnv hook bash)"   # For bash
  # OR
  eval "$(direnv hook zsh)"    # For zsh
  ```

### Configuration Files

The repository uses two key files:

1. `.env` - Contains environment variables
   ```
   ANSIBLE_CONFIG=~/.ansible-shoutsky.cfg
   ```

2. `.envrc` - direnv configuration file
   ```
   dotenv
   ```

3. `~/.ansible-shoutsky.cfg` - Ansible configuration
   ```ini
   [defaults]
   roles_path = ../roles
   inventory = ../inventory/hosts.yml
   filter_plugins = ../filter_plugins
   ```

### First-time setup

1. Navigate to the repository root
   ```bash
   cd /path/to/shoutsky-ansible
   ```

2. Allow direnv to load the environment
   ```bash
   direnv allow
   ```

3. (Optional) Whitelist the repository to auto-allow future changes
   ```bash
   mkdir -p ~/.config/direnv/
   echo '[whitelist]
   prefix = [ "/path/to/shoutsky-ansible" ]' > ~/.config/direnv/direnv.toml
   ```

## Usage

### Running Playbooks

Once the environment is set up, you can run playbooks from the playbooks directory:

```bash
cd /path/to/shoutsky-ansible/playbooks
ansible-playbook okd_cluster/bastion.yml
```

The environment variables will be automatically loaded, making the roles available without specifying the full path.

### How It Works

- When you enter the repository directory, direnv automatically loads the ANSIBLE_CONFIG environment variable
- This config uses relative paths (../roles) which work when running from the playbooks directory
- Ansible can now find roles simply by name (e.g., "okd_bind_dns") without needing the full path

### Troubleshooting

- If you see `direnv: error .envrc is blocked`, run `direnv allow`
- If roles aren't found, check that you're running from the playbooks directory
- To manually verify your environment, run `env | grep ANSIBLE`