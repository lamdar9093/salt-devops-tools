# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import az with context %}

{% set repoState = 'absent' %}
{% if az.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://packages.microsoft.com/repos/azure-cli ' ~ grains["oscodename"] ~ ' main' %}

azure-cli-repo:
  cmd.run:
    - name: |
        curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
        | gpg --yes --dearmor -o /etc/apt/keyrings/microsoft-archive-keyring.gpg
  pkgrepo.{{ repoState }}:
    - require:
      - cmd: azure-cli-repo
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Azure CLI Package Repository
    - name: deb [arch={{ grains["osarch"] }} signed-by=/etc/apt/keyrings/microsoft-archive-keyring.gpg] {{ url }}
    # - key_url: https://packages.microsoft.com/keys/microsoft.asc
    - aptkey: False
    - file: /etc/apt/sources.list.d/azure-cli.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
    {%- else %}
    - refresh_db: True
    {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://packages.microsoft.com/yumrepos/azure-cli' %}

azure-cli-repo:
  pkgrepo.{{ repoState }}:
    - name: azure-cli
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Azure CLI Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://packages.microsoft.com/keys/microsoft.asc
    - file: azure-cli.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
    {%- else %}
    - refresh_db: True
    {%- endif %}

{% endif %}