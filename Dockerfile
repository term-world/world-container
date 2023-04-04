FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "America/New_York" > /etc/timezone

RUN apt-get update && apt-get install -y \
  jq \
  git \
  curl \ 
  nano \
  sudo \
  tree \ 
  wget \
  tzdata \ 
  python3 \
  python3-dev \
  python3-pip \
  libcairo2-dev \
  python-is-python3

RUN python -m pip install \
  rich \
  typer \
  pillow \
  pyyaml \
  openai \
  arglite \
  seaborn \
  requests \
  matplotlib \
  gatorgrader \
  python-dotenv

RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/direvents.sh | cat >> /etc/bash.bashrc
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/gginstall.sh | sh
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/utilinstall.sh | sh
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN curl -fsSL https://api.github.com/repos/term-world/term-world-theme/releases/latest | wget $(jq -r ".assets[].browser_download_url")
RUN curl -fsSl https://api.github.com/repos/term-world/term-launcher/releases/latest | wget $(jq -r ".assets[].browser_download_url")

ADD ext/bierner.markdown-checkbox-0.4.0.vsix bierner.markdown-checkbox-0.4.0.vsix

ADD motd /etc/motd

RUN echo "cat /etc/motd" >> /etc/bash.bashrc

ADD world-cmd.sh /etc/profile.d/world-cmd.sh
ADD entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT /entrypoint.sh
