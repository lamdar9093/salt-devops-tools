# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import awscliv2 with context %}

include:
  {%- if awscliv2.enabled %}
  - .install
  {%- elif not awscliv2.enabled %}
  - .teardown
  {% endif %}