FROM dunglas/frankenphp:static-builder

WORKDIR /go/src/app/

COPY ./scripts ./scripts
COPY ./patches ./patches
 
COPY ./static-build-files dist/app

RUN bash ./scripts/apply-patches.sh
