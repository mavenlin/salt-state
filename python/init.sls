ipython:
  pkg.installed

python-pip:
  pkg.installed

python-scipy:
  pkg.installed

pyyaml:
  pip.installed:
    - require:
      - pkg: python-pip

simplejson:
  pip.installed:
    - require:
      - pkg: python-pip

scikit-image:
  pip.installed:
    - require:
      - pkg: python-pip
      - pkg: python-scipy

numpy:
  pip.installed:
    - require:
      - pkg: python-pip

easydict:
  pip.installed:
    - require:
      - pkg: python-pip