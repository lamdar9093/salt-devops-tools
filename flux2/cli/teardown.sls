# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flux2 with context %}

flux2-archive:
  file.absent:
    - name: /usr/local/flux2/{{ flux2.version }}

flux2:
  file.absent:
    - name: /usr/local/bin/flux
