# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argocd with context %}

argocd-binary:
  file.absent:
    - name: /usr/local/argocd/{{ argocd.version }}

argocd:
  file.absent:
    - name: /usr/local/bin/argocd
