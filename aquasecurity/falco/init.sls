# -*- coding: utf-8 -*-
# vim: ft=jinja

{%- if not grains['kernelrelease'].endswith('WSL2') %}
include:
  - .repo
  - .install
{%- endif %}
