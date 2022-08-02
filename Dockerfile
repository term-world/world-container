FROM ubuntu
RUN apt-get update && apt-get install -y \
  jq \
  git \
  curl \ 
  sudo \ 
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
  requests \
  gatorgrader \
  python-dotenv
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/direvents.sh | cat >> /etc/bash.bashrc
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/gginstall.sh | sh
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/utilinstall.sh | sh
RUN curl -fsSL https://code-server.dev/install.sh | sh
ADD motd /etc/motd
RUN echo "cat /etc/motd" >> /etc/bash.bashrc
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT /entrypoint.sh
