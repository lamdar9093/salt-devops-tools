# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import aws_nuke with context %}

include:
  {%- if aws_nuke.enabled %}
  - .install
  {%- elif not aws_nuke.enabled %}
  - .teardown
  {% endif %}