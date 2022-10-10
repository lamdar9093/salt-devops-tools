# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import helm with context %}

include:
  {%- if helm.enabled %}
  - .install
  {%- elif not helm.enabled %}
  - .teardown
  {% endif %}