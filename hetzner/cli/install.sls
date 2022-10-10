# -*- coding: utf-8 -*-
# vim: ft=jinja

{% from tpldir ~ "/map.jinja" import hcloud with context %}

hcloud-archive:
  archive.extracted:
    - name: /usr/local/hetzner/{{ hcloud.version }}
    - source: https://github.com/hetznercloud/cli/releases/download/v{{ hcloud.version }}/hcloud-linux-amd64.tar.gz
    - source_hash: https://github.com/hetznercloud/cli/releases/download/v{{ hcloud.version }}/checksums.txt
    - user: root
    - group: root
    - archive_format: tar
    - enforce_toplevel: false
    # - options: '--strip-components=1'
    - unless: ls /usr/local/hetzner/{{ hcloud.version }}

hcloud:
  file.symlink:
    - name: /usr/local/bin/hcloud
    - target: /usr/local/hetzner/{{ hcloud.version }}/hcloud
