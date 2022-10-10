# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import az with context %}

{% set repoState = 'absent' %}
{% if az.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://packages.microsoft.com/repos/azure-cli ' ~ grains["oscodename"] ~ ' main' %}

azure-cli-package-repository:
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} azure-cli Package Repository
    - name: deb [arch={{ grains["osarch"] }}] {{ url }}
    - key_url: https://packages.microsoft.com/keys/microsoft.asc
    - aptkey: False
    - file: /etc/apt/sources.list.d/azure-cli.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://packages.cloud.google.com/yum/repos/azure-cli-el7-x86_64' %}

azure-cli-repo:
  pkgrepo.{{ repoState }}:
    - name: azure-cli
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} azure-cli Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://packages.cloud.google.com/yum/doc/yum-key.gpg
    - file: azure-cli.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{% endif %}