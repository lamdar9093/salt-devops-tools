# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import samcli with context %}

samcli-teardown-install:
  file.absent:
    - name: /usr/local/aws-sam-cli

samcli-teardown-sam:
  file.absent:
    - name: /usr/local/bin/sam
