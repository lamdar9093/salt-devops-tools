# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argocd with context %}

argocd-binary:
  file.managed:
    - name: /usr/local/argocd/{{ argocd.version }}/argocd
    - source: https://github.com/argoproj/argo-cd/releases/download/v{{ argocd.version }}/argocd-linux-amd64
    - source_hash: https://github.com/argoproj/argo-cd/releases/download/v{{ argocd.version }}/argocd-linux-amd64.sha256
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/argocd/{{ argocd.version }}

argocd:
  file.symlink:
    - name: /usr/local/bin/argocd
    - target: /usr/local/argocd/{{ argocd.version }}/argocd
