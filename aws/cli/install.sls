# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import awscliv2 with context %}

awscliv2:
  archive.extracted:
    - name: /tmp/awscli
    - source: https://awscli.amazonaws.com/awscli-exe-linux-x86_64-{{ awscliv2.version }}.zip
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: zip
    - enforce_toplevel: false
    - unless: ls /usr/local/aws-cli/v2/{{ awscliv2.version }}
  cmd.run:
    - cwd: /tmp/awscli
    - name: |
        ./aws/install --update
    - runas: root
    - unless: cmp -s /usr/local/aws-cli/v2/current/bin/aws /tmp/awscli/aws/dist/aws
  file.absent:
    - name: /tmp/awscli
