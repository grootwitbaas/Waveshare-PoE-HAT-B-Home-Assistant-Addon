ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["busybox", "sh", "-c"]

# Install requirements for add-on

RUN \
  apk add --no-cache \
    python3 \
    openjpeg \
    tiff \
    openblas-dev \
    py3-pip

FROM python:3
RUN \
  pip install --no-cache-dir pillow && \
  pip install --no-cache-dir numpy && \
  pip3 install --no-cache-dir RPi.GPIO && \
  pip3 install --no-cache-dir smbus

COPY . .

# /bin/sh copy block
#
# FROM busybox:1.35.0-uclibc as busybox
#
# FROM gcr.io/distroless/base-debian11
#
# Now copy the static shell into base image.
# COPY --from=busybox /bin/sh /bin/sh
#
# You may also copy all necessary executables into distroless image.
# COPY --from=busybox /bin/mkdir /bin/mkdir
# COPY --from=busybox /bin/cat /bin/cat

CMD python ./bin/main.py

