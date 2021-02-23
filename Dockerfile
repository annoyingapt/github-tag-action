FROM ubuntu
LABEL "repository"="https://github.com/annoyingapt/github-tag-action"
LABEL "homepage"="https://github.com/annoyingapt/github-tag-action"
LABEL "original maintainer"="Nick Sjostrom"

COPY entrypoint.sh /entrypoint.sh

RUN apk update && apk add bash git curl jq && apk add --update nodejs npm && npm install -g semver

ENTRYPOINT ["/entrypoint.sh"]
