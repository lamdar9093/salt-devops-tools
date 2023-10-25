# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flux2 with context %}

include:
  {%- if flux2.enabled %}
  - .install
  {%- elif not flux2.enabled %}
  - .teardown
  {% endif %}