# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flamingo with context %}

flamingo-archive:
  file.absent:
    - name: /usr/local/flamingo/{{ flamingo.version }}

flamingo:
  file.absent:
    - name: /usr/local/bin/flamingo
