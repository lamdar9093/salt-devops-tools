# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import pulumi with context %}

pulumi-archive:
  file.absent:
    - name: /usr/local/pulumi/{{ pulumi.version }}

pulumi:
  file.absent:
    - name: /usr/local/bin/pulumi

pulumi-analyzer-policy:
  file.absent:
    - name: /usr/local/bin/pulumi-analyzer-policy

pulumi-analyzer-policy-python:
  file.absent:
    - name: /usr/local/bin/pulumi-analyzer-policy-python

pulumi-language-dotnet:
  file.absent:
    - name: /usr/local/bin/pulumi-language-dotnet

pulumi-language-go:
  file.absent:
    - name: /usr/local/bin/pulumi-language-go

pulumi-language-java:
  file.absent:
    - name: /usr/local/bin/pulumi-language-java

pulumi-language-nodejs:
  file.absent:
    - name: /usr/local/bin/pulumi-language-nodejs

pulumi-language-python:
  file.absent:
    - name: /usr/local/bin/pulumi-language-python

pulumi-language-python-exec:
  file.absent:
    - name: /usr/local/bin/pulumi-language-python-exec

pulumi-language-yaml:
  file.absent:
    - name: /usr/local/bin/pulumi-language-yaml

pulumi-resource-pulumi-nodejs:
  file.absent:
    - name: /usr/local/bin/pulumi-resource-pulumi-nodejs

pulumi-watch:
  file.absent:
    - name: /usr/local/bin/pulumi-watch