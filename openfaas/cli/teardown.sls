# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import openfaas with context %}

argocd-binary:
  file.absent:
    - name: /usr/local/openfaas/{{ openfaas.version }}

argocd:
  file.symlink:
    - name: /usr/local/bin/openfaas
