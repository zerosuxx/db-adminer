ARG FRANKENPHP_VERSION="1.5.0"

FROM dunglas/frankenphp:static-builder-musl-${FRANKENPHP_VERSION}

ENV FRANKENPHP_VERSION=${FRANKENPHP_VERSION}

WORKDIR /go/src/app/

COPY ./scripts ./scripts

COPY ./static-build-files dist/app

RUN bash ./scripts/apply-patches.sh
