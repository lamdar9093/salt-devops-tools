# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import openfaas with context %}

openfaas-binary:
  file.absent:
    - name: /usr/local/openfaas/{{ openfaas.version }}

openfaas:
  file.absent:
    - name: /usr/local/bin/openfaas
