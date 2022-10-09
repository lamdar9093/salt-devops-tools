# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import common with context %}

{% set repoState = 'removed' %}
{% if common.enabled %}
  {% set repoState = 'installed' %}
{% endif %}


common-packages:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in common.common %}
      - {{ item }}
      {% endfor %}

{%- if grains['os_family']|lower in ('debian',) %}
debian-packages:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in common.debian %}
      - {{ item }}
      {% endfor %}
{% endif %}

{%- if grains['os_family']|lower in ('redhat',) %}
redhat-packages:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in commond.redhat %}
      - {{ item }}
      {% endfor %}
{% endif %}