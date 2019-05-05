FROM pontusvisiongdpr/pontus-track-graphdb-base:latest as builder

RUN git clone  --depth 1 --single-branch --branch master https://github.com/pontusvision/pontus-nifi-processors.git
RUN cd pontus-nifi-processors && \
    mvn clean package -U -DskipTests

RUN git clone  --depth 1 --single-branch --branch master https://github.com/pontusvision/nifi-nlp-processor.git
RUN cd nifi-nlp-processor && \
    mvn clean package -U -DskipTests

    

FROM alpine
RUN mkdir -p /opt/nifi/nifi-current/lib
COPY --from=builder /pontus-nifi-processors/*/*/target/*.nar /opt/nifi/nifi-current/lib/
COPY --from=builder /nifi-nlp-processor/nifi-nlp-nar/target/*.nar /opt/nifi/nifi-current/lib/
