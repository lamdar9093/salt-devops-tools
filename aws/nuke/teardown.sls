# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import aws_nuke with context %}

aws-nuke-archive:
  file.absent:
    - name: /usr/local/aws-nuke/{{ aws_nuke.version }}

aws-nuke:
  file.absent:
    - name: /usr/local/bin/aws-nuke
