FROM ubuntu
LABEL "repository"="https://github.com/annoyingapt/github-tag-action"
LABEL "homepage"="https://github.com/annoyingapt/github-tag-action"
LABEL "original maintainer"="Nick Sjostrom"

COPY entrypoint.sh /entrypoint.sh

RUN apt update && apt add bash git curl jq && apt add --update nodejs npm && npm install -g semver

ENTRYPOINT ["/entrypoint.sh"]
