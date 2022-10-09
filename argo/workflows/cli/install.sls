# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argo with context %}

argo-archive:
  file.managed:
    - name: /usr/local/argo/{{ argo.version }}/argo-linux-amd64.gz
    - source: https://github.com/argoproj/argo-workflows/releases/download/v{{ argo.version }}/argo-linux-amd64.gz
    - source_hash: https://github.com/argoproj/argo-workflows/releases/download/v{{ argo.version }}/argo-linux-amd64.gz.sha256
    - makedirs: True
    - user: root
    - group: root
    - unless: ls /usr/local/argo/{{ argo.version }}
  module.run:
    - name: archive.gunzip
    - gzipfile: /usr/local/argo/{{ argo.version }}/argo-linux-amd64.gz
    - options: '--quiet'
    - unless: ls /usr/local/argo/{{ argo.version }}/argo-linux-amd64

argo-permissions:
  file.managed:
    - name: /usr/local/argo/{{ argo.version }}/argo-linux-amd64
    - user: root
    - group: root
    - mode: 755

argo:
  file.symlink:
    - name: /usr/local/bin/argo
    - target: /usr/local/argo/{{ argo.version }}/argo-linux-amd64
