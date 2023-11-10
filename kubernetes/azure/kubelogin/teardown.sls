# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import azurekubelogin with context %}

azurekubelogin-archive:
  file.absent:
    - name: /usr/local/azure-kubelogin/{{ azurekubelogin.version }}

azurekubelogin:
  file.absent:
    - name: /usr/local/bin/kubelogin
