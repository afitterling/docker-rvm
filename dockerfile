# set ARGS: RUBY=jruby|ruby
#           VERSION=x.xx

FROM debian

ARG DEBIAN_FRONTEND=noninteractive
ARG RUBY=ruby

RUN apt-get update -q && \
    apt-get install -qy git nodejs openjdk-11-jdk procps curl ca-certificates gnupg2 build-essential --no-install-recommends && apt-get clean

# if jruby install jdk
RUN if [ "${RUBY}" = "jruby" ] ; then\
 	apt-get install -qy openjdk-11-jdk;\ 
    fi

RUN gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s

RUN if [ "${VERSION}" = "" ] ; then\
        /bin/bash -l -c "rvm install ${RUBY}";\
    else\
        /bin/bash -l -c "rvm install ${RUBY}-${VERSION}";\
    fi

WORKDIR /app

RUN if [ "${VERSION}" = "" ] ; then\
        /bin/bash -l -c "rvm use ${RUBY}";\
    else\
        /bin/bash -l -c "rvm use ${RUBY}-${VERSION}";\
    fi

ENTRYPOINT ["/bin/bash", "-l", "-c"]

