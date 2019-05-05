FROM pontusvisiongdpr/pontus-extract-nifi-base:latest as builder
FROM apache/nifi-minifi 
USER 0
RUN cd /opt/minifi && ln -s minifi-* /opt/minifi/current
COPY --from=builder /opt/nifi/nifi-current/lib/*.nar /opt/minifi/minifi-0.5.0/lib/
USER minifi
