# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import gitops with context %}

include:
  {%- if gitops.enabled %}
  - .install
  {%- elif not gitops.enabled %}
  - .teardown
  {% endif %}