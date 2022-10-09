# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fission with context %}

argocd-binary:
  file.absent:
    - name: /usr/local/fission/{{ fission.version }}

argocd:
  file.symlink:
    - name: /usr/local/bin/fission
