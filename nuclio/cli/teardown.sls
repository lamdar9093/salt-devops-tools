# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import nuctl with context %}

nuctl-binary:
  file.absent:
    - name: /usr/local/nuclio/{{ nuctl.version }}

nuctl:
  file.absent:
    - name: /usr/local/bin/nuctl
