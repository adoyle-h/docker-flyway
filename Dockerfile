FROM openjdk:8u131-jre-alpine

# -------------- System Settings --------------

RUN until apk update; do sleep 1; done && \
    apk add --no-cache bash curl

# ------------ Application Settings ------------

ARG FLYWAY_VERSION=4.2.0

# 应用所在目录
ENV APP_DIR=/home/app \
    FLYWAY_VERSION=$FLYWAY_VERSION \
    FLYWAY_DB_DRIVER=MYSQL

WORKDIR $APP_DIR

LABEL maintainer="ADoyle <adoyle.h@gmail.com>" \
      flyway.version=$FLYWAY_VERSION

COPY src/download $APP_DIR/src/download
COPY src/logger.sh $APP_DIR/src/logger.sh
COPY Docker-assets $APP_DIR/Docker-assets
COPY Docker-assets/entrypoint.sh /opt/bin/entrypoint.sh
COPY Docker-assets/cmd.sh /opt/bin/cmd.sh

RUN \
    ./Docker-assets/install.sh && \
    ./Docker-assets/build.sh && \
    ./Docker-assets/clean.sh

COPY src/flyway $APP_DIR/src/flyway
COPY src/flyway.conf $APP_DIR/src/flyway.conf

RUN ln -s $APP_DIR/src/flyway /usr/local/bin/flyway

ENTRYPOINT ["/opt/bin/entrypoint.sh"]
CMD ["/opt/bin/cmd.sh"]
