FROM pontusvisiongdpr/pontus-track-graphdb-base:latest as builder

RUN git clone   --depth 1 --single-branch --branch master https://github.com/pontusvision/pontus-nifi-processors.git
RUN cd pontus-nifi-processors && \
    mvn clean package -U -DskipTests

RUN git clone  --depth 1 --single-branch --branch master https://github.com/pontusvision/nifi-nlp-processor.git
RUN cd nifi-nlp-processor && \
    mvn clean package -U -DskipTests

RUN mkdir /other-deps && \
    apk add  curl && \
    curl -L  'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.16.tar.gz' -o /other-deps/mysql-connector-java-8.0.16.tar.gz &&  \
    cd /other-deps && \
    tar zxvf /other-deps/mysql-connector-java-8.0.16.tar.gz mysql-connector-java-8.0.16/mysql-connector-java-8.0.16.jar 

RUN git clone  --depth 1 --single-branch  --branch master https://github.com/pontusvision/nifi-addons.git && \
    cd nifi-addons/Processors && \
    mvn clean install -U -DskipTests



FROM alpine
RUN mkdir -p /opt/nifi/nifi-current/lib
COPY --from=builder /pontus-nifi-processors/*/*/target/*.nar /opt/nifi/nifi-current/lib/
COPY --from=builder /nifi-nlp-processor/nifi-nlp-nar/target/*.nar /opt/nifi/nifi-current/lib/
COPY --from=builder /nifi-addons/Processors/*/*/target/*.nar /opt/nifi/nifi-current/lib/
COPY --from=builder /nifi-addons/Processors/*/*controller*/target/*ar /opt/nifi/nifi-current/lib/
COPY --from=builder /other-deps/mysql-connector-java-8.0.16/mysql-connector-java-8.0.16.jar /opt/nifi/nifi-current/lib/
