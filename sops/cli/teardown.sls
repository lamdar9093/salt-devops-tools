# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import sops with context %}

sops-binary:
  file.absent:
    - name: /usr/local/sops/{{ sops.version }}

sops:
  file.absent:
    - name: /usr/local/bin/sops
