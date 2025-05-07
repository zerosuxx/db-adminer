ARG FRANKENPHP_VERSION="1.5.0"

FROM dunglas/frankenphp:static-builder-gnu-${FRANKENPHP_VERSION}

ARG FRANKENPHP_VERSION

WORKDIR /go/src/app/

COPY ./scripts ./scripts

COPY ./static-build-files dist/app

RUN FRANKENPHP_VERSION=${FRANKENPHP_VERSION} bash ./scripts/apply-patches.sh
