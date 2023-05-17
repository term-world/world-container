FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York

RUN apt-get update && apt-get install -y \
  jq \
  git \
  curl \ 
  nano \
  sudo \
  tree \ 
  wget \
  tzdata \
  libcairo2-dev

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/direvents.sh | cat >> /etc/bash.bashrc
RUN curl -fsSL https://api.github.com/repos/term-world/term-world-theme/releases/latest | wget $(jq -r ".assets[].browser_download_url")
RUN curl -fsSl https://api.github.com/repos/term-world/term-launcher/releases/latest | wget $(jq -r ".assets[].browser_download_url")

ADD ext/bierner.markdown-checkbox-0.4.0.vsix bierner.markdown-checkbox-0.4.0.vsix

ADD motd /etc/motd

RUN echo "cat /etc/motd" >> /etc/bash.bashrc

ADD world-cmd.sh /etc/profile.d/world-cmd.sh
ADD entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT /entrypoint.sh
