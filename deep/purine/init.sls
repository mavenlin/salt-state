# dependencies of caffe

dependencies:
  pkg.installed:
    - names:
      - libgoogle-glog-dev
      - libprotobuf-dev
      - gcc-4.8
      - gcc-4.7
      - gcc-4.6
      - g++-4.8
      - g++-4.7
      - g++-4.6
      - libatlas-base-dev
      - liblmdb-dev
      - libgraphviz-dev
      - libgomp1

cmake:
  pkg:
    - installed

removed-openmpi:
  pkg.removed:
    - names:
      - libopenmpi-dev

install-mpich:
  pkg.installed:
    - names:
      - libmpich2-dev

download-libuv:
  cmd.run:
    - name: |
        cd /tmp
        wget -c http://libuv.org/dist/v1.4.0/libuv-v1.4.0.tar.gz
        tar xzf libuv-v1.4.0.tar.gz
    - unless: test -d /tmp/libuv-v1.4.0

install-libuv:
  cmd.run:
    - name: |
        cd /tmp
        cd libuv-v1.4.0
        ./autogen.sh
        ./configure --prefix=/usr/local
        make
        make install
    - unless: test -f /usr/local/lib/libuv.so.1
