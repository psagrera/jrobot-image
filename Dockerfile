FROM juniper/pyez:latest
## Pablo Sagrera Garcia
ENV ROBOT_FRAMEWORK_VERSION 4.0.2 

ENV PYTHONPATH /scripts/git-sync 

## Install build-base packages
RUN apk add --update \
         build-base \
         git \
         py3-pip \
         && rm -rf /var/cache/apk/*

## Install RobotFramework and others stuff
RUN pip3 install -U robotframework==$ROBOT_FRAMEWORK_VERSION \
                 PyYAML \
                 ixnetwork-restpy \
                 IxNetwork \
                 requests \
                 robotframework-requests \
                 robotframework-sshlibrary \
                 paramiko \
                 paramiko-expect \
                 jsnapy
COPY examples/ /scripts

WORKDIR /scripts
