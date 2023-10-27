# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fluxcd with context %}

fluxcd-archive:
  archive.extracted:
    - name: /usr/local/fluxcd/{{ fluxcd.version }}
    - source: https://github.com/fluxcd/flux2/releases/download/v{{ fluxcd.version }}/flux_{{ fluxcd.version }}_linux_amd64.tar.gz
    - source_hash: https://github.com/fluxcd/flux2/releases/download/v{{ fluxcd.version }}/flux_{{ fluxcd.version }}_checksums.txt
    - skip_verify: false
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: ls /usr/local/fluxcd/{{ fluxcd.version }}

fluxcd:
  file.symlink:
    - name: /usr/local/bin/flux
    - target: /usr/local/fluxcd/{{ fluxcd.version }}/flux
