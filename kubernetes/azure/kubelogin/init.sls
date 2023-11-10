# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import azurekubelogin with context %}

include:
  {%- if azurekubelogin.enabled %}
  - .install
  {%- elif not azurekubelogin.enabled %}
  - .teardown
  {% endif %}