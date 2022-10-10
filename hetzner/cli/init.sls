# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import hcloud with context %}

include:
  {%- if hcloud.enabled %}
  - .install
  {%- elif not hcloud.enabled %}
  - .teardown
  {% endif %}