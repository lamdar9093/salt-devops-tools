# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fluxcd with context %}

fluxcd-archive:
  file.absent:
    - name: /usr/local/fluxcd/{{ fluxcd.version }}

fluxcd:
  file.absent:
    - name: /usr/local/bin/flux
