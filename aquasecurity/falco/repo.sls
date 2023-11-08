# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import falco with context %}

{% set repoState = 'absent' %}
{% if falco.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://download.falco.org/packages/deb stable main' %}

falco-repo:
  cmd.run:
    - name: |
        curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key \
        | gpg --yes --dearmor -o /usr/share/keyrings/falco-archive-keyring.gpg
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Falco Security Package Repository
    - name: deb [signed-by=/etc/apt/keyrings/trivy-archive-keyring.gpg arch={{ grains["osarch"] }}] {{ url }}
    - aptkey: False
    - file: /etc/apt/sources.list.d/falcosecurity.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://download.falco.org/packages/rpm' %}

falco-repo:
  pkgrepo.{{ repoState }}:
    - name: falco
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Falco Security Package Repository
    - base_url: {{ url }}
    - key_url: https://falco.org/repo/falcosecurity-3672BA8F.asc
    - enabled: 1
    - gpgcheck: 1
    - file: falcosecurity.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{% endif %}
