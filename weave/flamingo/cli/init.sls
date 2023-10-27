# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import flamingo with context %}

include:
  {%- if flamingo.enabled %}
  - .install
  {%- elif not flamingo.enabled %}
  - .teardown
  {% endif %}