#Based on https://llandy3d.github.io/sway-on-ubuntu/simple_install/
from ubuntu:21.04

RUN apt-get update

#tzdata non interactive
RUN export DEBIAN_FRONTEND=noninteractive \
    && ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime \ 
    && apt-get install -y tzdata \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y build-essential git python3-pip

RUN apt-get install -y wayland-protocols \
    libwayland-dev \
    libegl1-mesa-dev \
    libgles2-mesa-dev \
    libdrm-dev \
    libgbm-dev \
    libinput-dev \
    libxkbcommon-dev \
    libgudev-1.0-dev \
    libpixman-1-dev \
    libsystemd-dev \
    cmake \
    libpng-dev \
    libavutil-dev \
    libavcodec-dev \
    libavformat-dev \
    ninja-build \
    meson

RUN apt-get install -y libxcb-composite0-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-render0-dev \
        libxcb-xfixes0-dev \
        libxkbcommon-dev \
        libxcb-xinput-dev \
        libx11-xcb-dev

RUN apt-get install -y libjson-c-dev \
    libpango1.0-dev \
    libcairo2-dev \
    libgdk-pixbuf2.0-dev \
    scdoc

RUN apt-get install -y wget
RUN wget http://archive.ubuntu.com/ubuntu/pool/universe/m/meson/meson_0.57.0+really0.56.2-0.1_all.deb \
    && dpkg -i meson_0.57.0+really0.56.2-0.1_all.deb \
    && rm meson_0.57.0+really0.56.2-0.1_all.deb


RUN mkdir /sway-build

RUN git clone https://github.com/swaywm/wlroots.git /sway-build/wlroots
WORKDIR /sway-build/wlroots
RUN git checkout 0.14.1

RUN git clone https://github.com/swaywm/sway.git /sway-build/sway
WORKDIR /sway-build/sway
RUN git checkout 1.6.1

COPY ./bin /opt/bin
COPY ./entrypoint /
RUN chmod +x /opt/bin/* \
    && chmod +x /entrypoint

ENTRYPOINT [ "/entrypoint" ]
CMD ["help"]