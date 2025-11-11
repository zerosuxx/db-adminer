FROM zerosuxx/alpine:latest

ARG ADMINER_VERSION="4.8.4-evo.1"

RUN curl -sSfL https://github.com/zerosuxx/db-adminer/releases/download/${ADMINER_VERSION}/adminer-$(arch)-linux -o /usr/local/bin/adminer-server && \
    chmod +x /usr/local/bin/adminer-server

COPY ./config/php /etc/php/config

ENV PHP_INI_SCAN_DIR=/etc/php/config
ENV SESSION_PATH=/home/app/.session

USER app

RUN mkdir -p ${SESSION_PATH}

EXPOSE 8080

CMD ["adminer-server", "--listen", "0.0.0.0:8080"]
