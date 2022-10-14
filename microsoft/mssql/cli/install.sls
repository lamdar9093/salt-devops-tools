# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import mssql with context %}

{% set pkgState = 'removed' %}
{% if mssql.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

odbc-dependencies:
  pkg.installed:
    - pkgs:
      {%- if grains['os_family']|lower in ('debian',) %}   
      - build-essential
      - ca-certificates
      - python3-dev
      - lsb-release
      {%- elif grains['os_family']|lower in ('redhat',) %}
      - epel-release
      - gcc-c++
      - system-lsb-core
      {%- endif %}

odbc:
  pkg.{{ pkgState }}:
    - pkgs:
      {%- if grains['os_family']|lower in ('debian',) %}   
      - freetds-dev
      - unixodbc-dev
      - tdsodbc
      {%- elif grains['os_family']|lower in ('redhat',) %}
      - unixODBC-devel
      - freetds-devel
      {%- endif %}

mssql:
  environ.setenv:
    - name: ACCEPT_EULA
    - value: Y
    - update_minion: true
  pkg.{{ pkgState }}:
    - require:
      - pkg: odbc
    - pkgs:
      - msodbcsql17
      - mssql-tools
