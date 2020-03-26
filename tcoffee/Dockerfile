FROM ubuntu:16.04
LABEL maintainer="Suzanne Jin <suzanne.jin@crg.es>"

ARG CACHEBUST=1

## Basic tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ed \
      less \
      vim-tiny \
      wget \
      git \
      python3 \ 
      build-essential \
      cmake \
      curl \
      libargtable2-0 \
      ca-certificates \
      libpng12-0 \
      python3-biopython \
      python3-numpy \ 
      python3-setuptools \
      default-jdk \
      libpng-dev \
      tcsh \ 
      unzip


# Change working directory, where the softwares will be installed
WORKDIR /usr/src/app


# Install TCOFFEE
RUN git clone https://github.com/cbcrg/tcoffee.git tcoffee && \
    cd tcoffee && \
    git checkout 83095e9d430e83424ccf7f50af82e16c2c3b49d4 && \
    cd t_coffee/src && \
    make t_coffee && \
    cp t_coffee /bin/.


ENV CACHE_4_TCOFFEE ${TMPDIR:-/tmp}/.tcoffee/cache
ENV LOCKDIR_4_TCOFFEE ${TMPDIR:-/tmp}/.tcoffee/lock
ENV TMP_4_TCOFFEE ${TMPDIR:-/tmp}/.tcoffee/tmp
ENV HOME_4_TCOFFEE ~/.tcoffee/
ENV HOME /

ENTRYPOINT ["t_coffee"]