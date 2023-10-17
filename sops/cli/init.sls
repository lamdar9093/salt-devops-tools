# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import sops with context %}

include:
  {%- if sops.enabled %}
  - .install
  {%- elif not sops.enabled %}
  - .teardown
  {% endif %}