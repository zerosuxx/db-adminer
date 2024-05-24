FROM dunglas/frankenphp:static-builder

COPY ./scripts /tmp/scripts
COPY ./patches /tmp/patches
 
WORKDIR /go/src/app/

COPY ./static-build-files dist/app

RUN bash /tmp/scripts/apply-patches.sh
