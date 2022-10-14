# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import mcli with context %}

mcli:
  {%- if mcli.enabled %}
  pkg.installed:
    - sources:
      {%- if grains['os_family']|lower in ('debian',) %}
      - mcli: https://dl.min.io/client/mc/release/linux-amd64/mcli_{{ mcli.version }}_amd64.deb
      {%- elif grains['os_family']|lower in ('redhat',) %}
      - mcli: https://dl.min.io/client/mc/release/linux-amd64/mcli-{{ mcli.version }}.x86_64.rpm
      {%- endif %}
  {%- else %}
  pkg.removed:
    - name: mccli
  {%- endif %}