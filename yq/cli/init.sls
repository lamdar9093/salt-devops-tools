# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import yq with context %}

include:
  {%- if yq.enabled %}
  - .install
  {%- elif not yq.enabled %}
  - .teardown
  {% endif %}