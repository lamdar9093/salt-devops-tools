# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import trivy with context %}

{% set pkgState = 'removed' %}
{% if trivy.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

trivy-packages:
  pkg.{{ pkgState }}:
    - pkgs:
        {%- if grains['os_family']|lower in ('debian',) %}     
        - trivy: {{ trivy.version }}
        {%- elif grains['os_family']|lower in ('redhat',) %}
        - trivy: {{ trivy.version }}-1
        {%- endif %}
