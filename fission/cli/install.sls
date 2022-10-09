# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fission with context %}

fission-binary:
  file.managed:
    - name: /usr/local/fission/{{ fission.version }}/fission-linux-amd64
    - source: https://github.com/fission/fission/releases/download/v{{ fission.version }}/fission-v{{ fission.version }}-linux-amd64
    - source_hash: https://github.com/fission/fission/releases/download/v{{ fission.version }}/fission-v{{ fission.version }}-linux-amd64.sig
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/fission/{{ fission.version }}

fission:
  file.symlink:
    - name: /usr/local/bin/fission
    - target: /usr/local/fission/{{ fission.version }}/fission-linux-amd64
    - mode: 755
