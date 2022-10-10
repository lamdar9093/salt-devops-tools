# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import scw with context %}

scaleway-cli-binary:
  file.absent:
    - name: /usr/local/scaleway/{{ scw.version }}

scaleway-cli:
  file.absent:
    - name: /usr/local/bin/scaleway-cli

scw:
  file.absent:
    - name: /usr/local/bin/scw
