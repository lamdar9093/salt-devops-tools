# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gcloud with context %}

{% set pkgState = 'removed' %}
{% if gcloud.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

google-cloud-cli:
  pkg.{{ pkgState }}:
    - version: {{ gcloud.version }}-0
