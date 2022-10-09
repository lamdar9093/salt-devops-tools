# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import kubectl with context %}

{% set repoState = 'absent' %}
{% if kubectl.enabled %}
  {% set repoState = 'installed' %}
{% endif %}

kubectl:
  pkg.{{ repoState }}:
    - version: {{ kubectl.version }}-00
