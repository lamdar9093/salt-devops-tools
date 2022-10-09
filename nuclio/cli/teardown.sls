# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import nuctl with context %}

argocd-binary:
  file.absent:
    - name: /usr/local/nuclio/{{ nuctl.version }}

argocd:
  file.symlink:
    - name: /usr/local/bin/nuctl
