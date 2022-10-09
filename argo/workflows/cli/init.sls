# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argo with context %}

include:
  {%- if argo.enabled %}
  - .install
  {%- elif not argo.enabled %}
  - .teardown
  {% endif %}