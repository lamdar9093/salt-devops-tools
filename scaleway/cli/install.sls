# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import scw with context %}

scaleway-cli-binary:
  file.managed:
    - name: /usr/local/scaleway/{{ scw.version }}/scaleway-cli
    - source: https://github.com/scaleway/scaleway-cli/releases/download/v{{ scw.version }}/scaleway-cli_{{ scw.version }}_linux_amd64
    - source_hash: https://github.com/scaleway/scaleway-cli/releases/download/v{{ scw.version }}/SHA256SUMS
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/scaleway/{{ scw.version }}

scaleway-cli:
  file.symlink:
    - name: /usr/local/bin/scaleway-cli
    - target: /usr/local/scaleway/{{ scw.version }}/scaleway-cli
    - mode: 755

scw:
  file.symlink:
    - name: /usr/local/bin/scw
    - target: /usr/local/scaleway/{{ scw.version }}/scaleway-cli
    - mode: 755
