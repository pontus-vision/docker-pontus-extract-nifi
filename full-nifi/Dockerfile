FROM pontusvisiongdpr/pontus-extract-nifi-base:latest as builder
FROM apache/nifi 
COPY --chown=nifi:nifi --from=builder /opt/nifi/nifi-current/lib/*ar /opt/nifi/nifi-current/lib/
COPY --chown=nifi:nifi flow.xml.gz /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi client.yml /opt/nifi/nifi-current/conf/
COPY --chown=nifi:nifi bootstrap.conf /opt/nifi/nifi-current/conf/

