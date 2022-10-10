# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import nuctl with context %}

nuctl-binary:
  file.managed:
    - name: /usr/local/nuclio/{{ nuctl.version }}/nuctl-linux-amd64
    - source: https://github.com/nuclio/nuclio/releases/download/{{ nuctl.version }}/nuctl-{{ nuctl.version }}-linux-amd64
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 755
    - unless: ls /usr/local/nuclio/{{ nuctl.version }}

nuctl:
  file.symlink:
    - name: /usr/local/bin/nuctl
    - target: /usr/local/nuclio/{{ nuctl.version }}/nuctl-linux-amd64
    - mode: 755
