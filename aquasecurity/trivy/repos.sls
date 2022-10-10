# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import trivy with context %}

{% set repoState = 'absent' %}
{% if trivy.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://aquasecurity.github.io/trivy-repo/deb ' ~ grains["oscodename"] ~ ' main' %}

trivy-repo:
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} trivy Security Package Repository
    - name: deb [arch={{ grains["osarch"] }}] {{ url }}
    - key_url: https://aquasecurity.github.io/trivy-repo/deb/public.key
    - aptkey: False
    - file: /etc/apt/sources.list.d/trivy.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://aquasecurity.github.io/trivy-repo/rpm/releases/$releasever/$basearch' %}

trivy-repo:
  pkgrepo.{{ repoState }}:
    - name: trivy
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Trivy Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 0
    - file: trivy.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}
