# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import kubectl with context %}

{% set pkgState = 'removed' %}
{% if kubectl.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

kubectl:
  pkg.{{ pkgState }}:
    - version: {{ kubectl.version }}-00
