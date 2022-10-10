# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import az with context %}

{% set repoState = 'absent' %}
{% if az.enabled %}
  {% set repoState = 'installed' %}
{% endif %}

azure-cli:
  pkg.{{ repoState }}:
    - version: {{ az.version }}-1~{{ grains["oscodename"] }}
