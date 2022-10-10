# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import helm with context %}

helm-archive:
  archive.extracted:
    - name: /usr/local/helm/{{ helm.version }}
    - source: https://get.helm.sh/helm-v{{ helm.version }}-linux-amd64.tar.gz
    - source_hash: https://get.helm.sh/helm-v{{ helm.version }}-linux-amd64.tar.gz.sha256sum
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - options: '--strip-components=1'
    - unless: ls /usr/local/helm/{{ helm.version }}

helm:
  file.symlink:
    - name: /usr/local/bin/helm
    - target: /usr/local/helm/{{ helm.version }}/helm
