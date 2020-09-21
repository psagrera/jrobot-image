FROM juniper/pyez:latest
## Pablo Sagrera Garcia
ENV ROBOT_FRAMEWORK_VERSION 3.1.2

ENV PYTHONPATH /scripts/git-sync 

## Install build-base packages
RUN apk add --update \
         build-base \
         git \
         && rm -rf /var/cache/apk/*

## Install RobotFramework and others stuff
RUN pip3 install -U robotframework==$ROBOT_FRAMEWORK_VERSION \
                 PyYAML \
                 requests \
                 robotframework-requests \
                 paramiko \
                 paramiko-expect \
                 jsnapy
COPY examples/ /scripts

WORKDIR /scripts
