# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gcloud with context %}

{% set repoState = 'absent' %}
{% if gcloud.enabled %}
  {% set repoState = 'installed' %}
{% endif %}

google-cloud-cli:
  pkg.{{ repoState }}:
    - version: {{ gcloud.version }}-0
