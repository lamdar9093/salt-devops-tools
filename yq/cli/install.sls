# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import yq with context %}

yq-binary:
  file.managed:
    - name: /usr/local/yq/{{ yq.version }}/yq
    - source: https://github.com/mikefarah/yq/releases/download/v{{ yq.version }}/yq_linux_amd64
    - source_hash: https://github.com/mikefarah/yq/releases/download/v{{ yq.version }}/checksums
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: '0755'
    - unless: ls /usr/local/yq/{{ yq.version }}

yq:
  file.symlink:
    - name: /usr/local/bin/yq
    - target: /usr/local/yq/{{ yq.version }}/yq
    - mode: '0755'
