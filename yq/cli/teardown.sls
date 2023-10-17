# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import yq with context %}

yq-binary:
  file.absent:
    - name: /usr/local/yq/{{ yq.version }}

yq:
  file.absent:
    - name: /usr/local/bin/yq
