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
  sqlite3 \
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
  python-dotenv --break-system-packages

ARG GITHUB_CDN=https://raw.githubusercontent.com/term-world/world-container/main

RUN curl -fsSL $GITHUB_CDN/scripts/direvents.sh | cat >> /etc/bash.bashrc
RUN curl -fsSL $GITHUB_CDN/scripts/gginstall.sh | sh
RUN curl -fsSL $GITHUB_CDN/scripts/utilinstall.sh | sh

# chompchain install: for future edge builds

#RUN git clone https://github.com/term-world/chompchain-wallet.git
#RUN cd chompchain-wallet && python -m pip install .

#RUN git clone https://github.com/term-world/chompchain.git
#RUN cd chompchain && python -m pip install .

#RUN git clone https://github.com/term-world/falcon-sign.git
#RUN cd falcon-sign && python -m pip install .

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -fsSL https://api.github.com/repos/term-world/term-world-theme/releases/latest | wget $(jq -r ".assets[].browser_download_url")
RUN curl -fsSl https://api.github.com/repos/term-world/term-launcher/releases/latest | wget $(jq -r ".assets[].browser_download_url")

RUN wget $GITHUB_CDN/extensions/bierner.markdown-checkbox-0.4.0.vsix
RUN wget $GITHUB_CDN/scripts/motd

RUN cp motd /etc/motd

RUN echo "cat /etc/motd" >> /etc/bash.bashrc

RUN wget $GITHUB_CDN/scripts/world-cmd.sh
RUN cp world-cmd.sh /etc/profile.d/world-cmd.sh

ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ENTRYPOINT /entrypoint.sh
