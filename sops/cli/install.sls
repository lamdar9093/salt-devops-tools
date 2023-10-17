# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import sops with context %}

sops-binary:
  file.managed:
    - name: /usr/local/sops/{{ sops.version }}/sops
    - source: https://github.com/getsops/sops/releases/download/v{{ sops.version }}/sops-v{{ sops.version }}.linux.amd64
    - source_hash: https://github.com/getsops/sops/releases/download/v{{ sops.version }}/sops-v{{ sops.version }}.checksums.txt
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/sops/{{ sops.version }}

sops:
  file.symlink:
    - name: /usr/local/bin/sops
    - target: /usr/local/sops/{{ sops.version }}/sops
    - mode: 755
