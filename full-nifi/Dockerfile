FROM pontusvisiongdpr/pontus-extract-nifi-base:latest as builder
FROM apache/nifi 
COPY --from=builder /opt/nifi/nifi-current/lib/*ar /opt/nifi/nifi-current/lib/
COPY  flow.xml.gz /opt/nifi/nifi-current/conf/
COPY client.yml /opt/nifi/nifi-current/conf/
COPY bootstrap.conf /opt/nifi/nifi-current/conf/
