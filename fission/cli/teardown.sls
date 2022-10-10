# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fission with context %}

fission-binary:
  file.absent:
    - name: /usr/local/fission/{{ fission.version }}

fission:
  file.absent:
    - name: /usr/local/bin/fission
