FROM ubuntu:18.04

# Install required packages
RUN apt-get update && apt-get install -y \
    bc \
    bison \
    binutils \
    build-essential \
    bzip2 \
    chrpath \
    cpio \
    diffstat \
    flex \
    gawk \
    gcc-arm-linux-gnueabi \
    git \
    gzip \
    libsdl1.2-dev \
    libssl-dev \
    locales \
    mtools \
    ncurses-dev \
    openssh-server \
    patch \
    perl \
    python \
    python3 \
    rsync \
    sshpass \
    sudo \
    tar \
    texinfo \
    tmux \
    unzip \
    vim \
    whiptail \
    wget \
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

# Set up ssh client options
RUN echo "StrictHostKeyChecking accept-new" >> /etc/ssh/ssh_config

# Add non-root user
RUN useradd --create-home user && echo "user:user" | chpasswd
USER user

# Set up terminal
RUN sed -ri 's/^#force_color_prompt/force_color_prompt/' ~/.bashrc && sed -ri 's/1;32m/1;35m/' ~/.bashrc

# Set up vim
RUN echo "colorscheme desert" > ~/.vimrc

# Set up EnvVars for ARM cross compile
ENV CROSS_COMPILE="arm-linux-gnueabi-" ARCH="arm"

# Set up workdir volume
VOLUME /work
WORKDIR /work