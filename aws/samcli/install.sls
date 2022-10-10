# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import samcli with context %}

samcli:
  archive.extracted:
    - name: /tmp/samcli
    - source: https://github.com/aws/aws-sam-cli/releases/download/v{{ samcli.version }}/aws-sam-cli-linux-x86_64.zip
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: zip
    - enforce_toplevel: false
    - unless: ls /usr/local/aws-sam-cli/{{ samcli.version }}
  cmd.run:
    - cwd: /tmp/samcli
    - name: |
        ./install --update
    - runas: root
    - unless: cmp -s /usr/local/aws-sam-cli/current/bin/sam /tmp/samcli/dist/sam
  file.absent:
    - name: /tmp/samcli
