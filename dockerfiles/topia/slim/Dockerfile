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

RUN apt-get remove python3 -y

ARG GITHUB_CDN=https://raw.githubusercontent.com/term-world/world-container/main

RUN curl -fsSL $GITHUB_CDN/scripts/direvents.sh | cat >> /etc/bash.bashrc

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -fsSL https://api.github.com/repos/term-world/term-world-theme/releases/latest | wget $(jq -r ".assets[].browser_download_url")
RUN curl -fsSl https://api.github.com/repos/term-world/term-launcher/releases/latest | wget $(jq -r ".assets[].browser_download_url")

RUN wget $GITHUB_CDN/extensions/bierner.markdown-checkbox-0.4.0.vsix
RUN wget $GITHUB_CDN/scripts/motd

RUN cp motd /etc/motd

RUN echo "cat /etc/motd" >> /etc/bash.bashrc

RUN wget $GITHUB_CDN/scripts/world-cmd.sh
RUN wget $GITHUB_CDN/scripts/gatorgrader
RUN wget $GITHUB_CDN/scripts/helper
RUN cp world-cmd.sh /etc/profile.d/world-cmd.sh
RUN cp gatorgrade /usr/local/bin/
RUN cp helper /usr/local/bin/

RUN chmod +x /usr/local/bin/gatorgrade
RUN chmod +x /usr/local/bin/helper

ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT /entrypoint.sh