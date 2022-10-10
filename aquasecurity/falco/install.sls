# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import falco with context %}

{% set pkgState = 'removed' %}
{% if falco.enabled %}
  {% set pkgState = 'installed' %}
{% endif %}

falco-packages:
  pkg.{{ pkgState }}:
    - pkgs:
        {%- if grains['os_family']|lower in ('debian',) %}     
        - linux-headers-{{ grains['kernelrelease'] }}
        {%- endif %}
        - falco: {{ falco.version }}
        {%- elif grains['os_family']|lower in ('redhat',) %}
        - epel-release
        - kernel-devel-{{ grains['kernelrelease'] }}
        - falco: {{ falco.version }}-1
        {%- endif %}
