# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import terraform with context %}

{% set repoState = 'absent' %}
{% if terraform.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
{% set url = 'https://apt.releases.hashicorp.com ' ~ grains["oscodename"] ~ ' main' %}

hashicorp-repo:
  file.managed:
    - name: /etc/apt/keyrings/hashicorp-archive-keyring.key
    - source: https://apt.releases.hashicorp.com/gpg
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - watch:
      - file: /etc/apt/keyrings/hashicorp-archive-keyring.key
    - name: |
        cat /etc/apt/keyrings/hashicorp-archive-keyring.key \
        | gpg --dearmor | \
        tee /etc/apt/keyrings/hashicorp-archive-keyring.gpg > /dev/null
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Hashicorp Package Repository
    - name: deb [arch={{ grains["osarch"] }} signed-by=/etc/apt/keyrings/hashicorp-archive-keyring.gpg] {{ url }}
    # - key_url: https://apt.releases.hashicorp.com/gpg
    - aptkey: False
    - file: /etc/apt/sources.list.d/hashicorp.list
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo' %}

hashicorp-repo:
  pkgrepo.{{ repoState }}:
    - name: hashicorp
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Hashicorp Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 0
    - file: hashicorp.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{% endif %}