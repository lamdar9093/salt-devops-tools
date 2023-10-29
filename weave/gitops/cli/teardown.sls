# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gitops with context %}

gitops-archive:
  file.absent:
    - name: /usr/local/gitops/{{ gitops.version }}

gitops:
  file.absent:
    - name: /usr/local/bin/gitops
