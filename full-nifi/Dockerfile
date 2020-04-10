FROM pontusvisiongdpr/pontus-extract-nifi-base:latest as builder
FROM apache/nifi:1.9.2
USER root
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y groovy 
USER nifi
COPY --chown=nifi:nifi --from=builder /opt/nifi/nifi-current/lib/*ar /opt/nifi/nifi-current/lib/
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi client.yml /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi bootstrap.conf /opt/nifi/nifi-current/conf/
COPY dcache.groovy /opt/nifi/nifi-current/conf/
ENV TZ=UTC

