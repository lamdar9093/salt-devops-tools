# salt-ubuntu-devops-tools

> **Windows Users**: [Setup appropriate WSL engine](./WSL2.md)

## Enable passwordless sudo

Run the following command line to enable passwordless sudo access.

```bash
cat <<EOF | sudo tee /etc/sudoers.d/$(id -un)
$(id -un) ALL=(ALL:ALL) NOPASSWD:ALL
EOF
```

## Install Salt

```bash
sudo apt update -y \
&& sudo apt upgrade -y \
&& sudo apt install -y git salt-minion
```

## Clone this repo

Run the following commands to clone the repository and set appropriate permissions.

```bash
sudo git clone https://github.com/fjudith/salt-ubuntu-devops-tools /srv/salt \
&& sudo chown -R $(id -un) /srv/salt
```
