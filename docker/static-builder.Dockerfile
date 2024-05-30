FROM dunglas/frankenphp:static-builder-1.1.5

WORKDIR /go/src/app/

COPY ./scripts ./scripts
COPY ./patches ./patches

COPY ./static-build-files dist/app

RUN bash ./scripts/apply-patches.sh
