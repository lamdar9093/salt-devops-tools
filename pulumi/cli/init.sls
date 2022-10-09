# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import pulumi with context %}

include:
  {%- if pulumi.enabled %}
  - .install
  {%- elif not pulumi.enabled %}
  - .teardown
  {% endif %}