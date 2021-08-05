# -- [ Base setup ] -----------------------------------------------------------
FROM ubuntu:18.04 AS poky-base

# Install required packages
RUN apt-get update && apt-get install -y \
    bc \
    bison \
    binutils \
    build-essential \
    bzip2 \
    chrpath \
    cpio \
    curl \
    diffstat \
    flex \
    gawk \
    git \
    gzip \
    libsdl1.2-dev \
    libssl-dev \
    locales \
    mc \
    mtools \
    ncurses-dev \
    patch \
    perl \
    python \
    python3 \
    rsync \
    screen \
    sudo \
    tar \
    texinfo \
    tmux \
    unzip \
    vim \
    whiptail \
    wget \
    xterm \
    xxd

# Set locale to EN-US UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LC_ALL en_US.UTF-8 
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en   

# Add custom scripts
ADD push_netfiles /usr/bin
RUN chmod +x /usr/bin/push_netfiles

# Prepare User
ARG USERNAME=user

# Add user to sudoers
RUN echo "user	ALL=(ALL)	NOPASSWD:ALL" >> /etc/sudoers.d/user

# Add non-root user
RUN useradd --create-home user && echo "user:user" | chpasswd
USER user

# Set up terminal
ENV TERM=xterm-256color 
RUN sed -ri 's/1;32m/1;35m/' ~/.bashrc

# Set up tmux
ADD .tmux.conf /home/user

# Set up vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN echo "so ~/.vim/plugins.vim" > /home/user/.vimrc
ADD plugins.vim /home/user/.vim
RUN vim +PlugInstall +qall
ADD .vimrc /home/user


# Set up cache volumes
VOLUME /mnt/sstate-cache
VOLUME /mnt/dl-cache

# Set up netboot volumes
VOLUME /srv/nfs
VOLUME /srv/tftp

# Set up workdir volume
VOLUME /work
WORKDIR /work


# -- [ ARM target ] -----------------------------------------------------------
FROM poky-base AS poky-arm

# ROOT tasks
USER root

# Install ARM cross-toolchain
RUN apt-get update && apt-get install -y \ 
     gcc-arm-linux-gnueabi

# USER tasks
USER user

# Set up env vars for ARM cross-compilation
ENV CROSS_COMPILE="arm-linux-gnueabi-" ARCH="arm"


# -- [ x86 target ] -----------------------------------------------------------
FROM poky-base AS poky-x86 
