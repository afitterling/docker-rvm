FROM debian

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q && \
    apt-get install -qy bash zsh tmux vim vim-doc --no-install-recommends && apt-get clean

# secure the apps
RUN groupadd -g 3000 devgroup \ 
    && useradd -r -u 4000 -g devgroup dev
USER dev

WORKDIR /app
ENV PROMPT='%F{blue}%1~%f %# '
ENTRYPOINT ["/bin/zsh", "-l", "-c" ]
CMD ["zsh"]
