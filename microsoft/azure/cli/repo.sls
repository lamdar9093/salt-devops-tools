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
  file.managed:
    - name: /etc/apt/keyrings/microsoft-archive-keyring.key
    - source: https://packages.microsoft.com/keys/microsoft.asc
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - watch:
      - file: /etc/apt/keyrings/microsoft-archive-keyring.key
    - name: |
        cat /etc/apt/keyrings/microsoft-archive-keyring.key \
        | gpg --dearmor | \
        tee /etc/apt/keyrings/microsoft-archive-keyring.gpg > /dev/null
  pkgrepo.{{ repoState }}:
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