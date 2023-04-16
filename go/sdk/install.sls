# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import go with context %}

go:
  archive.extracted:
    - name: /usr/local/go/{{ go.version }}
    - source: https://go.dev/dl/go{{ go.version }}.linux-amd64.tar.gz
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: /usr/local/go/{{ go.version }}
  file.symlink:
    - name: /usr/local/bin/go
    - target:  /usr/local/go/{{ go.version }}/go/bin/go

gofmt:no-loc:
  file.symlink:
    - name: /usr/local/bin/gofmt
    - target:  /usr/local/go/{{ go.version }}/go/bin/gofmt