# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import ldap with context %}

{% set repoState = 'removed' %}
{% if ldap.enabled %}
  {% set repoState = 'installed' %}
{% endif %}


ldap-common:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in ldap.common %}
      - {{ item }}
      {% endfor %}

{%- if grains['os_family']|lower in ('debian',) %}
ldap-debian:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in ldap.debian %}
      - {{ item }}
      {% endfor %}
{% endif %}

{%- if grains['os_family']|lower in ('redhat',) %}
ldap-redhat:
  pkg.{{ repoState }}:
    - skip_suggestions: True
    - refresh: True
    - allow_updates: True
    - pkgs:
      {%- for item in ldap.redhat %}
      - {{ item }}
      {% endfor %}
{% endif %}