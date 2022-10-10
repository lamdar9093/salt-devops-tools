# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import az with context %}

{% set pkgState = 'removed' %}
{% if az.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

azure-cli:
  pkg.{{ pkgState }}:
    - version: {{ az.version }}-1~{{ grains["oscodename"] }}
