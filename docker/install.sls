# -*- coding: utf-8 -*-
# vim: ft=jinja

{%- from tpldir ~ "/map.jinja" import docker with context %}


docker-ce:
  {%- if docker.daemon.enabled %}
  pkg.installed:
    - version: '5:{{ docker.daemon.version }}-1~ubuntu.{{ grains["osrelease"] }}~{{ grains["oscodename"] }}'
  {%- else %}}
  pkg.absent:
  {%- endif %}

docker-ce-cli:
  {%- if docker.cli.enabled %}
  pkg.installed:
    - version: '5:{{ docker.cli.version }}-1~ubuntu.{{ grains["osrelease"] }}~{{ grains["oscodename"] }}'
  {%- else %}}
  pkg.absent:
  {%- endif %}

containerd.io:
  {%- if docker.containerd.enabled %}
  pkg.installed:
    - version: '{{ docker.containerd.version }}-1'
  {%- else %}}
  pkg.absent:
  {%- endif %}

docker-buildx-plugin:
  {%- if docker.buildx_plugin.enabled %}
  pkg.installed:
    - version: '{{ docker.buildx_plugin.version }}-1~ubuntu.{{ grains["osrelease"] }}~{{ grains["oscodename"] }}'
  {%- else %}}
  pkg.absent:
  {%- endif %}

docker-compose-plugin:
  {%- if docker.compose_plugin.enabled %}
  pkg.installed:
    - version: '{{ docker.compose_plugin.version }}-1~ubuntu.{{ grains["osrelease"] }}~{{ grains["oscodename"] }}'
  {%- else %}}
  pkg.absent:
  {%- endif %}