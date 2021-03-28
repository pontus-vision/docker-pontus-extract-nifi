ARG NIFI_TAG=1.13.2
FROM pontusvisiongdpr/pontus-extract-nifi-base:${NIFI_TAG} as builder
FROM apache/nifi:${NIFI_TAG} as nifi
FROM ubuntu:20.04 as final

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y jq python3-pip procps xmlstarlet openjdk-14-jdk curl groovy && \
    apt clean

RUN pip3 install awscli
ARG TR_NIFI_JSON_BUCKET
ARG TR_NIFI_TEST_DATA_TAG
ENV TR_NIFI_JSON_BUCKET=${TR_NIFI_JSON_BUCKET}
ENV TR_NIFI_TEST_DATA_TAG=${TR_NIFI_TEST_DATA_TAG}

ARG UID=1000
ENV NIFI_BASE_DIR=/opt/nifi
ENV NIFI_HOME ${NIFI_BASE_DIR}/nifi-current
ENV NIFI_TOOLKIT_HOME ${NIFI_BASE_DIR}/nifi-toolkit-current

ENV NIFI_PID_DIR=${NIFI_HOME}/run
ENV NIFI_LOG_DIR=${NIFI_HOME}/logs

ENV NIFI_PATH=${NIFI_HOME}

# Setup NiFi user and create necessary directories
RUN useradd --shell /bin/bash -u ${UID} -m -U -d ${NIFI_HOME} nifi

USER nifi

COPY --chown=nifi:nifi --from=nifi  /opt/nifi/ /opt/nifi/
COPY --chown=nifi:nifi --from=builder /opt/nifi/nifi-current/lib/*ar /opt/nifi/nifi-current/lib/
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi client.yml /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi bootstrap.conf /opt/nifi/nifi-current/conf/
COPY dcache.groovy /opt/nifi/nifi-current/conf/
ENV TZ=UTC

