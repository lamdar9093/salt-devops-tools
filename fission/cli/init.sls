# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import fission with context %}

include:
  {%- if fission.enabled %}
  - .install
  {%- elif not fission.enabled %}
  - .teardown
  {% endif %}