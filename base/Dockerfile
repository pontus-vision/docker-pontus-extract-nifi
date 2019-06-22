FROM pontusvisiongdpr/pontus-graphdb-lib:latest as builder

RUN cd / && \
    mkdir /other-deps && \
    apk add  curl && \
    curl -L  'https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.16.tar.gz' -o /other-deps/mysql-connector-java-8.0.16.tar.gz &&  \
    cd /other-deps && \
    tar zxvf /other-deps/mysql-connector-java-8.0.16.tar.gz mysql-connector-java-8.0.16/mysql-connector-java-8.0.16.jar  && \
    curl -L  'https://jdbc.postgresql.org/download/postgresql-42.2.6.jar' -o /other-deps/postgresql-42.2.6.jar 

#RUN cd / && \
#    git  clone --depth 1  --single-branch --branch master https://github.com/pontusvision/pontus-nifi-processors.git && \
#    cd pontus-nifi-processors && \
#    mvn clean package -U -DskipTests 
#
#RUN cd / && \
#    git clone --depth 1 --single-branch --branch master https://github.com/pontusvision/nifi-nlp-processor.git && \
#    cd nifi-nlp-processor && \
#    mvn clean package -U -DskipTests
#
#RUN cd / && \
#    git clone   --depth 1 --single-branch  --branch master https://github.com/pontusvision/nifi-addons.git && \
#    cd nifi-addons/Processors && \
#    mvn clean install -U -DskipTests
#
#RUN git clone  --depth  1  --single-branch --branch  master https://github.com/pontus-vision/pontus-nifi-processors-office365.git && \
#    cd pontus-nifi-processors-office365 && \
#    mvn clean install -U -DskipTests
#
#RUN git clone   --depth 1   --single-branch  --branch master https://github.com/pontus-vision/pontus-nifi-processors-salesforce.git && \
#    cd  pontus-nifi-processors-salesforce && \
#    mvn clean install -U -DskipTests
#

FROM pontusvisiongdpr/pontus-nifi-gremlin-lib as gremlin

FROM alpine
RUN   mkdir -p /opt/nifi/nifi-current/lib
COPY --from=gremlin /opt/nifi/nifi-current/lib/* /opt/nifi/nifi-current/lib/
COPY --from=pontusvisiongdpr/pontus-nifi-processors-nlp-lib /opt/nifi/nifi-current/lib/* /opt/nifi/nifi-current/lib/
COPY --from=pontusvisiongdpr/pontus-nifi-addons-lib /opt/nifi/nifi-current/lib/* /opt/nifi/nifi-current/lib/
COPY --from=pontusvisiongdpr/pontus-nifi-processors-office365-lib /opt/nifi/nifi-current/lib/* /opt/nifi/nifi-current/lib/
COPY --from=pontusvisiongdpr/pontus-nifi-processors-salesforce-lib /opt/nifi/nifi-current/lib/* /opt/nifi/nifi-current/lib/
COPY --from=builder /other-deps/mysql-connector-java-8.0.16/mysql-connector-java-8.0.16.jar /opt/nifi/nifi-current/lib/
COPY --from=builder /other-deps/postgresql-42.2.6.jar  /opt/nifi/nifi-current/lib/
