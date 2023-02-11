# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import githubcli with context %}

{% set repoState = 'absent' %}
{% if githubcli.enabled %}
  {% set repoState = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
  {% set url = 'https://cli.github.com/packages ' ~ 'stable' ~ ' main' %}

githubcli-repo:
  file.managed:
    - name: /etc/apt/keyrings/githubcli-archive-keyring.gpg
    - source: https://cli.github.com/packages/githubcli-archive-keyring.gpg
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 644
  pkgrepo.{{ repoState }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} Github CLI Package Repository
    - name: deb [signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] {{ url }}
    - aptkey: False
    - file: /etc/apt/sources.list.d/githubcli.list
    - clean_file: True
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://cli.github.com/packages/rpm/gh-cli.repo' %}

githubcli-repo:
  pkgrepo.{{ repoState }}:
    - name: githubcli
    - humanname: {{ grains["os"] }} {{ grains["oscodename"] | capitalize }} GitHub CLI Package Repository
    - base_url: {{ url }}
    - enabled: 1
    - gpgcheck: 0
    - file: githubcli.repo
    {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}

{% endif %}