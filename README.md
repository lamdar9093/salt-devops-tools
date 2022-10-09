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


## Deploy Salt Pillar from the example

Run the following commands to configure the pillar.

```bash
sudo mkdir -vp /srv/pillar \
&& sudo chown $(id -un) /srv/pillar \
&& cp -vf /srv/salt/pillar.sls.example /srv/pillar/devops.sls \
&& cp -vf /srv/salt/pillar.top.sls.example /srv/pillar/top.sls
```

Edit the `/etc/pillar/devops.sls` to customize installed tools

## Installation

Run the following command to install the tools locally with Salt (i.e. Salt Masterless)

```bash
sudo salt-call --local  state.highstate --file-root=/srv/salt --pillar-root=/srv/pillar --retcode-passthrough -l info
```

