# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import pulumi with context %}

pulumi-archive:
  archive.extracted:
    - name: /usr/local/pulumi/{{ pulumi.version }}
    - source: https://github.com/pulumi/releases/download/v{{ pulumi.version }}/pulumi-v{{ pulumi.version }}-linux-x64.tar.gz
    - skip_verify: true
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    - options: '--strip-components=1'
    - unless: ls /usr/local/pulumi/{{ pulumi.version }}

pulumi:
  file.symlink:
    - name: /usr/local/bin/pulumi
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi

pulumi-analyzer-policy:
  file.symlink:
    - name: /usr/local/bin/pulumi-analyzer-policy
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-analyzer-policy

pulumi-analyzer-policy-python:
  file.symlink:
    - name: /usr/local/bin/pulumi-analyzer-policy-python
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-analyzer-policy-python

pulumi-language-dotnet:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-dotnet
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-dotnet

pulumi-language-go:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-go
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-go

pulumi-language-java:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-java
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-java

pulumi-language-nodejs:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-nodejs
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-nodejs

pulumi-language-python:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-python
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-python

pulumi-language-python-exec:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-python-exec
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-python-exec

pulumi-language-yaml:
  file.symlink:
    - name: /usr/local/bin/pulumi-language-yaml
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-language-yaml

pulumi-resource-pulumi-nodejs:
  file.symlink:
    - name: /usr/local/bin/pulumi-resource-pulumi-nodejs
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-resource-pulumi-nodejs

pulumi-watch:
  file.symlink:
    - name: /usr/local/bin/pulumi-watch
    - target: /usr/local/pulumi/{{ pulumi.version }}/pulumi-watch
