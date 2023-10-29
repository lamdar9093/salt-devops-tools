# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gitops with context %}

gitops-archive:
  archive.extracted:
    - name: /usr/local/gitops/{{ gitops.version }}
    - source: https://github.com/weaveworks/weave-gitops/releases/download/v{{ gitops.version }}/gitops-Linux-x86_64.tar.gz
    - source_hash: https://github.com/weaveworks/weave-gitops/releases/download/v{{ gitops.version }}/gitops_checksums.txt
    - skip_verify: false
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: ls /usr/local/gitops/{{ gitops.version }}

gitops:
  file.symlink:
    - name: /usr/local/bin/gitops
    - target: /usr/local/gitops/{{ gitops.version }}/gitops
