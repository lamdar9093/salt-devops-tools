# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fluxcd with context %}

include:
  {%- if fluxcd.enabled %}
  - .install
  {%- elif not fluxcd.enabled %}
  - .teardown
  {% endif %}