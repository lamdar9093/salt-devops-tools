# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import awscliv2 with context %}

awscliv2-teardown-install:
  file.absent:
    - name: /usr/local/aws-cli/v2/{{ awscliv2.version }}

awscliv2-teardown-aws:
  file.absent:
    - name: /usr/local/bin/aws
  
awscliv2-teardown-aws-completer:
  file.absent:
    - name: /usr/local/bin/aws_completer
