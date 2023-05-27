# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import mssql with context %}

{% set repoState = 'absent' %}
{% if mssql.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://packages.microsoft.com/' ~ grains["osfullname"]|lower ~ '/' ~ grains["osrelease"]|lower ~ '/prod ' ~ grains["oscodename"] ~ ' main' %}

msprod-repo:
  cmd.run:
    - name: |
        curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
        | gpg --yes --dearmor -o /etc/apt/keyrings/microsoft-sql-archive-keyring.gpg
  pkgrepo.{{ repoState }}:
    - require:
      - cmd: msprod-repo
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Microsoft Package Repository
    - name: deb [arch={{ grains["osarch"] }} signed-by=/etc/apt/keyrings/microsoft-sql-archive-keyring.gpg] {{ url }}
    - file: /etc/apt/sources.list.d/msprod.list
    - aptkey: False
    - clean_file: True
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
    {%- else %}
    - refresh_db: True
    {%- endif %}


{%- elif grains['os_family']|lower in ('redhat',) %}
  {% set url = 'https://packages.microsoft.com/rhel/' ~ grains["osrelease"]|lower ~ '/prod' ~ grains["oscodename"] ~ ' main' %}

msprod-repo:
  pkgrepo.{{ repoState }}:
    - name: msprod
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Microsoft Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://packages.microsoft.com/keys/microsoft.asc
    - file: msprod.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
    {%- else %}
    - refresh_db: True
    {%- endif %}

{% endif %}