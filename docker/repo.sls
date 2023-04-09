{#- Get the `tplroot` from `tpldir` #}
{%- from tpldir ~ "/map.jinja" import docker with context %}

{% set repo_state = 'absent' %}
{% if docker.use_upstream_repo or docker.use_old_repo %}
  {% set repo_state = 'managed' %}
{% endif %}

{%- if grains['os_family']|lower in ('debian',) %}
{% set url = 'https://download.docker.com/linux/ubuntu ' ~ grains["oscodename"] ~ ' stable' %}

docker-repo:
  file.managed:
    - name: /etc/apt/keyrings/docker-archive-keyring.key
    - source: https://download.docker.com/linux/ubuntu/gpg
    - skip_verify: true
    - makedirs: true
    - user: root
    - group: root
    - mode: 644
  cmd.run:
    - watch:
      - file: /etc/apt/keyrings/docker-archive-keyring.key
    - name: |
        cat /etc/apt/keyrings/docker-archive-keyring.key \
        | gpg --dearmor | \
        tee /etc/apt/keyrings/docker-archive-keyring.gpg > /dev/null
  pkgrepo.{{ repo_state }}:
    - humanname: {{ grains["os"] }} {{ grains["oscodename"]|capitalize }} Docker Package Repository
    - name: deb [arch={{ grains["osarch"] }} signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] {{ url }}
    - file: /etc/apt/sources.list.d/docker.list
        {%- if grains['saltversioninfo'] >= [2018, 3, 0] %}
    - refresh: True
        {%- else %}
    - refresh_db: True
        {%- endif %}
    {# - require_in:
      - pkg: docker
    - require:
      - pkg: docker-dependencies #}

{%- elif grains['os_family']|lower in ('redhat',) %}
{% set url = 'https://yum.dockerproject.org/repo/main/centos/$releasever/' if docker.use_old_repo else docker.repo.url_base %}

docker-repo:
  pkgrepo.{{ repo_state }}:
    - name: docker-ce-stable
    - humanname: {{ grains['os'] }} {{ grains["oscodename"]|capitalize }} Docker Package Repository
    - baseurl: {{ url }}
    - enabled: 1
    - gpgcheck: 1
    {% if docker.use_old_repo %}
    - gpgkey: https://yum.dockerproject.org/gpg
    {% else %}
    - gpgkey: https://download.docker.com/linux/centos/gpg
    {% endif %}
    {# - require_in:
      - pkg: docker-package
    - require:
      - pkg: docker-package-dependencies #}

{%- else %}
docker-repo: {}
{%- endif %}