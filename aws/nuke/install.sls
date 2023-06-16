# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import aws_nuke with context %}

aws-nuke-archive:
  archive.extracted:
    - name: /usr/local/aws-nuke/{{ aws_nuke.version }}
    - source: https://github.com/rebuy-de/aws-nuke/releases/download/v{{ aws_nuke.version }}/aws-nuke-v{{ aws_nuke.version }}-linux-amd64.tar.gz
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - unless: ls /usr/local/aws-nuke/{{ aws_nuke.version }}

aws-nuke:
  file.symlink:
    - name: /usr/local/bin/aws-nuke
    - target: /usr/local/aws-nuke/{{ aws_nuke.version }}/aws-nuke-v{{ aws_nuke.version }}-linux-amd64
