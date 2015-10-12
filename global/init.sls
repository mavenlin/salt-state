vim:
  pkg:
    - installed

udisks:
  pkg:
    - installed

pmount:
  pkg:
    - installed

emacs24:
  pkg:
    - installed

screen:
  pkg:
    - installed

gdb:
  pkg:
    - installed

htop:
  pkg:
    - installed

automake:
  pkg:
    - installed

git:
  pkg:
    - installed

sysstat:
  pkg:
    - installed

hydra:
  pkg:
    - installed

wput:
  pkg:
    - installed

markdown:
  pkg:
    - installed

iotop:
  pkg:
    - installed

global:
  pkg:
    - installed

iftop:
  pkg:
    - installed

ipython-notebook:
  pkg:
    - installed

eog:
  pkg:
    - installed

curl:
  pkg:
    - installed

/etc/apt/sources.list:
  file.managed:
    - source: salt://files/sources.list
    - mode: 644
    - user: root
    - group: root
    - makedirs: True