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
        - gh
