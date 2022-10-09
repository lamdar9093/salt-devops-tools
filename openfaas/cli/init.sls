# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import openfaas with context %}

include:
  {%- if openfaas.enabled %}
  - .install
  {%- elif not openfaas.enabled %}
  - .teardown
  {% endif %}