FROM pontusvisiongdpr/pontus-extract-nifi-base:latest as builder
FROM apache/nifi 
COPY --from=builder /opt/nifi/nifi-current/lib/*.nar /opt/nifi/nifi-current/lib/
