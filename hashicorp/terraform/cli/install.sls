# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import terraform with context %}

{% set repoState = 'absent' %}
{% if terraform.enabled %}
  {% set repoState = 'installed' %}
{% endif %}

terraform:
  pkg.{{ repoState }}:
    - version: {{ terraform.version }}
