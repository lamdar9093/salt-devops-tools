# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import samcli with context %}

include:
  {%- if samcli.enabled %}
  - .install
  {%- elif not samcli.enabled %}
  - .teardown
  {% endif %}