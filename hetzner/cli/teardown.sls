# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import hcloud with context %}

hcloud-archive:
  file.absent:
    - name: /usr/local/hetzner/{{ hcloud.version }}

hcloud:
  file.absent:
    - name: /usr/local/bin/hcloud
