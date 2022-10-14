# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import mssql with context %}

{% set fileState = 'absent' %}
{% if mssql.enabled %}
  {% set fileState = 'managed' %}
{% endif %}

odbc-driver-config:
  file.{{ fileState }}:
    - name: /etc/odbcinst.ini
    - source: salt://{{ tpldir }}/templates/odbcinst.ini
    - user: root
    - group: root
    - mode: "0644"
    - context:
      tpldir: {{ tpldir }}