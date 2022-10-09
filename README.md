# salt-ubuntu-devops-tools

## Windows Users

Install WSL Preview and Ubuntu 22.04 LTS from the Microsoft Store

* [WSL Preview](https://aka.ms/wslstorepage)
* [Ubuntu 22.04](https://apps.microsoft.com/store/detail/ubuntu-22041-lts)

### Enable Systemd

Launch the Ubuntu distribution, then run the following command line to enable SystemD.

```bash
cat <<EOF | sudo tee -a /etc/wsl.conf
[default]
systemd = true
EOF
```

### Install Salt

```bash
sudo apt update -y \
&& sudo apt upgrade -y \
&& sudo apt install salt-minion
```
