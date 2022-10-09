# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import openfaas with context %}

openfaas-binary:
  file.managed:
    - name: /usr/local/openfaas/{{ openfaas.version }}/faas-cli
    - source: https://github.com/openfaas/faas-cli/releases/download/{{ openfaas.version }}/faas-cli
    - source_hash: https://github.com/openfaas/faas-cli/releases/download/{{ openfaas.version }}/faas-cli.sha256
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/openfaas/{{ openfaas.version }}

openfaas:
  file.symlink:
    - name: /usr/local/bin/faas-cli
    - target: /usr/local/openfaas/{{ openfaas.version }}/faas-cli
    - mode: 755
