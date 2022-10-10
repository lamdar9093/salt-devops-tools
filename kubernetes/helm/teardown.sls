# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import helm with context %}

helm-archive:
  file.absent:
    - name: /usr/local/helm/{{ helm.version }}

helm:
  file.absent:
    - name: /usr/local/bin/helm
