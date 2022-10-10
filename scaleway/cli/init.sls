# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import scw with context %}

include:
  {%- if scw.enabled %}
  - .install
  {%- elif not scw.enabled %}
  - .teardown
  {% endif %}