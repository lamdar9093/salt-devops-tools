# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import azurekubelogin with context %}

azurekubelogin-archive:
  archive.extracted:
    - name: /usr/local/azure-kubelogin/{{ azurekubelogin.version }}
    - source: https://github.com/Azure/kubelogin/releases/download/v{{ azurekubelogin.version }}/kubelogin-linux-amd64.zip
    - source_hash: https://github.com/Azure/kubelogin/releases/download/v{{ azurekubelogin.version }}/kubelogin-linux-amd64.zip.sha256
    - skip_verify: false
    - user: root
    - group: root
    - archive_format: zip
    - enforce_toplevel: true
    - unless: ls /usr/local/azure-kubelogin/{{ azurekubelogin.version }}

azurekubelogin:
  file.symlink:
    - name: /usr/local/bin/kubelogin
    - target: /usr/local/azure-kubelogin/{{ azurekubelogin.version }}/kubelogin
