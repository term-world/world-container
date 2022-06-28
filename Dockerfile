FROM ubuntu
RUN apt-get update && apt-get install -y \
  jq \
  git \
  curl \ 
  sudo \ 
  python3 \
  python3-pip \
  python-is-python3
RUN python -m pip install \
  typer \
  pyyaml \
  requests \
  gatorgrader \
  python-dotenv
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/direvents.sh | cat >> /etc/bash.bashrc
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/gginstall.sh | sh
RUN curl -fsSL https://raw.githubusercontent.com/term-world/world-container/main/utilinstall.sh | sh
RUN curl -fsSL https://code-server.dev/install.sh | sh
ADD entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT /entrypoint.sh
