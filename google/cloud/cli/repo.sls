# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gcloud with context %}

{% set repoState = 'absent' %}
{% if gcloud.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://packages.cloud.google.com/apt cloud-sdk main' %}

gcloud-repo:
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Google Cloud SDK Package Repository
    - name: deb [arch={{ grains["osarch"] }}] {{ url }}
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
    - aptkey: False
    - file: /etc/apt/sources.list.d/google-cloud-sdk.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://packages.cloud.google.com/yum/repos/cloud-sdk-el8-x86_64' %}

gcloud-repo:
  pkgrepo.{{ repoState }}:
    - name: Google Cloud SDK
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Google Cloud SDK Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 1
    - gpgkey: https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
    - file: google-cloud-sdk.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{% endif %}