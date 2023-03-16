# Setup Windows Subsystem for Linux 2 (WSL2)

Run the following command from a Powershell or Powershell prompt with Administrator privileges.

```Powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all
```

Install WSL Preview and Ubuntu 22.04 LTS from the Microsoft Store

* [WSL Preview](https://aka.ms/wslstorepage)
* [Ubuntu 22.04](https://apps.microsoft.com/store/detail/ubuntu-22041-lts/9PN20MSR04DW)

## Enable Systemd

Launch the Ubuntu distribution, then run the following command to enable SystemD.

```bash
cat <<EOF | sudo tee -a /etc/wsl.conf
[boot]
systemd = true
EOF
```

From a CMD prompt, run the following command to stop the WSL engine.

```bash
wsl --shutdown
```

Relauch the Ubuntu distribution.
