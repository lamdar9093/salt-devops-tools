# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import trivy with context %}

{% set repoState = 'absent' %}
{% if trivy.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://aquasecurity.github.io/trivy-repo' ~ '/deb '~ grains["oscodename"] ~ ' main' %}

trivy-repo:
  cmd.run:
    - name: |
        curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key \
        | gpg --yes --dearmor -o /etc/apt/keyrings/trivy-archive-keyring.gpg
  pkgrepo.{{ repoState }}:
    - require:
      - cmd: trivy-repo
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Trivy Package Repository
    - name: deb [signed-by=/etc/apt/keyrings/trivy-archive-keyring.gpg] {{ url }}
    # - key_url: https://aquasecurity.github.io/trivy-repo/deb/public.key
    - aptkey: False
    - file: /etc/apt/sources.list.d/trivy.list
    - clean_file: True
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

{% endif %}
