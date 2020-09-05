FROM debian:buster
LABEL author="Bryan Vaz"
LABEL version="1.0"
LABEL copyright="2020, Bryan Vaz"

RUN apt-get update &&\
    apt-get install -y \
      bash \
      bc \
      build-essential \
      ccache \
      curl \
      ecj \
      fastjar \
      file \
      flex \
      g++ \
      gawk \
      gettext \
      git \
      git-core \
      git-doc \
      groff \
      java-propose-classpath \
      less \
      libc6 \
      libelf-dev \
      libncurses5 \
      libncurses5-dev \
      libssl-dev \
      make \
      patch \
      python \
      python-distutils-extra \
      python3 \
      python3-distutils \
      python3-distutils-extra \
      rsync \
      subversion \
      sudo \
      time \
      unzip \
      wget \
      xsltproc \
      xz-utils \
      zip \
      zlib1g-dev \
      && \
    apt-get clean && \
    useradd -m user && \
    echo 'user ALL=NOPASSWD: ALL' > /etc/sudoers.d/user

################################################
# Change non-root User
# From https://github.com/docker-library/python/blob/master/3.6/jessie/Dockerfile
################################################
USER user
WORKDIR /home/user

# set dummy git config
RUN git config --global user.name "user" && git config --global user.email "user@example.com"