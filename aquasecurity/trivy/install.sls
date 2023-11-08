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
        - trivy
