# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flamingo with context %}

flamingo-archive:
  archive.extracted:
    - name: /usr/local/flamingo/{{ flamingo.version }}
    - source: https://github.com/flux-subsystem-argo/cli/releases/download/v{{ flamingo.version }}/flamingo_{{ flamingo.version }}_linux_amd64.tar.gz
    - source_hash: https://github.com/flux-subsystem-argo/cli/releases/download/v{{ flamingo.version }}/flamingo_{{ flamingo.version }}_checksums.txt
    - skip_verify: false
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: ls /usr/local/flamingo/{{ flamingo.version }}

flamingo:
  file.symlink:
    - name: /usr/local/bin/flamingo
    - target: /usr/local/flamingo/{{ flamingo.version }}/flamingo
