# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import argocd with context %}

include:
  {%- if argocd.enabled %}
  - .install
  {%- elif not argocd.enabled %}
  - .teardown
  {% endif %}