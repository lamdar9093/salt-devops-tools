# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flux2 with context %}

flux2-archive:
  archive.extracted:
    - name: /usr/local/flux2/{{ flux2.version }}
    - source: https://github.com/fluxcd/flux2/releases/download/v{{ flux2.version }}/flux_{{ flux2.version }}_linux_amd64.tar.gz
    - source_hash: https://github.com/fluxcd/flux2/releases/download/v{{ flux2.version }}/flux_{{ flux2.version }}_checksums.txt
    - skip_verify: false
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: ls /usr/local/flux2/{{ flux2.version }}

flux2:
  file.symlink:
    - name: /usr/local/bin/flux
    - target: /usr/local/flux2/{{ flux2.version }}/flux
