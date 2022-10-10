# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import terraform with context %}

{% set pkgState = 'removed' %}
{% if terraform.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

terraform:
  pkg.{{ pkgState }}:
    - version: {{ terraform.version }}
