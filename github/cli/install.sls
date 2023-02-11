# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import githubcli with context %}

{% set pkgState = 'removed' %}
{% if githubcli.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

githubcli-packages:
  pkg.{{ pkgState }}:
    - pkgs:
        {%- if grains['os_family']|lower in ('debian',) %}     
        - gh: {{ githubcli.version }}
        {%- elif grains['os_family']|lower in ('redhat',) %}
        - gh: {{ githubcli.version }}-1
        {%- endif %}
