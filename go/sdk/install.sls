# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import go with context %}

{% set url = 'https://go.dev/dl' ~ '/go' ~ go.version ~ '.' ~ go.platform ~ '-' ~ go.architecture ~ '.tar.gz' %}

go:
  archive.extracted:
    - name: /usr/local/go/{{ go.version }}
    - source: {{ url }} 
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: /usr/local/go/{{ go.version }}
  environ.setenv:
    - name: GOPATH
    - value: /usr/local/go/{{ go.version }}/go
    - update_minion: true
  file.symlink:
    - name: /usr/local/bin/go
    - target:  /usr/local/go/{{ go.version }}/go/bin/go

gofmt:
  file.symlink:
    - name: /usr/local/bin/gofmt
    - target:  /usr/local/go/{{ go.version }}/go/bin/gofmt
  