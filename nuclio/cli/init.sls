# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import nuctl with context %}

include:
  {%- if nuctl.enabled %}
  - .install
  {%- elif not nuctl.enabled %}
  - .teardown
  {% endif %}