ARG SYSTEM=ubuntu
FROM ${SYSTEM}

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=worker
ARG GROUP=work

# ESSENTIAL
RUN apt-get update -q && \
    apt-get install -qy --no-install-recommends \
    npm nodejs \
    python3 \
    iputils-ping \
    python3-cairo python3-wheel \
    python3-setuptools python3-dev \
    python3-pip build-essential \
    vim git curl \
    zsh \
     && apt-get clean

# secure the apps
RUN groupadd -g 3000 ${GROUP} \ 
    && useradd -r -u 4000 -g ${GROUP} ${USER}

#set home
RUN mkdir /home/${USER}
RUN chown ${USER} /home/${USER}

WORKDIR /home/${USER}
RUN echo "#empty" > .zshrc

USER ${USER}

ENV USER=${USER}
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/${USER}/.local/bin:/app/node_modules/.bin
ENV PROMPT='%F{blue}%n@%1~%f %# '

WORKDIR /app

ENTRYPOINT ["/bin/zsh", "-l", "-c" ]
CMD ["zsh"]
