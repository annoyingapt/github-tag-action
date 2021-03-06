FROM ubuntu:20.04
LABEL "repository"="https://github.com/annoyingapt/github-tag-action"
LABEL "homepage"="https://github.com/annoyingapt/github-tag-action"
LABEL "original maintainer"="Nick Sjostrom"

COPY entrypoint.sh /entrypoint.sh
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && apt update && apt -y install apt-utils xz-utils node-semver bash git curl jq wget && wget -O node-v15.9.0-linux-x64.tar.xz https://nodejs.org/dist/v15.9.0/node-v15.9.0-linux-x64.tar.xz && mkdir /usr/local/lib/nodejs && tar -xJvf node-v15.9.0-linux-x64.tar.xz -C /usr/local/lib/nodejs && export PATH=/usr/local/lib/nodejs/node-v15.9.0-linux-x64/bin:$PATH && . ~/.profile

ENTRYPOINT ["/entrypoint.sh"]
