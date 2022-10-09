# -*- coding: utf-8 -*-
# vim: ft=jinja

awscliv2-teardown-install:
  file.absent:
    - name: /usr/local/aws-cli

awscliv2-teardown-aws:
  file.absent:
    - name: /usr/local/bin/aws
  
awscliv2-teardown-aws-completer:
  file.absent:
    - name: /usr/local/bin/aws_completer
