/tmp/NVIDIA-Linux-x86_64-346.35.run:
  file.managed:
    - source: salt://files/NVIDIA-Linux-x86_64-346.35.run
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

install-nvidia:
  cmd.run:
    - name: /tmp/NVIDIA-Linux-x86_64-346.35.run -aq --install-vdpau-wrapper --ui=none
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 900
    - unless: test `find /lib/modules -name *nvidia.ko* | wc -l` -gt 0

/tmp/cuda_7.0.28_linux.run:
  file.managed:
    - source: salt://files/cuda_7.0.28_linux.run
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

install-cuda:
  cmd.run:
    - name: /tmp/cuda_7.0.28_linux.run -toolkit -silent
    - cwd: /tmp
    - shell: /bin/bash
    - timeout: 900
    - unless: test -d /usr/local/cuda-7.0

/usr/local/lib/libcudnn_static.a:
  file.managed:
    - source: salt://cudnn/cuda/lib64/libcudnn_static.a
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

/usr/local/lib/libcudnn.so.7.0.58:
  file.managed:
    - source: salt://cudnn/cuda/lib64/libcudnn.so.7.0.58
    - mode: 755
    - user: root
    - group: root
    - makedirs: True

/usr/local/include/cudnn.h:
  file.managed:
    - source: salt://cudnn/cuda/include/cudnn.h
    - mode: 644
    - user: root
    - group: root
    - makedirs: True

/usr/local/lib/libcudnn.so:
  file.symlink:
    - target: /usr/local/lib/libcudnn.so.7.0.58
    - force: True

/usr/local/lib/libcudnn.so.7.0:
  file.symlink:
    - target: /usr/local/lib/libcudnn.so.7.0.58
    - force: True
