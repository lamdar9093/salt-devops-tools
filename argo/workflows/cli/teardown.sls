# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argo with context %}

argo-binary:
  file.absent:
    - name: /usr/local/argo/{{ argo.version }}

argo:
  file.absent:
    - name: /usr/local/bin/argo
