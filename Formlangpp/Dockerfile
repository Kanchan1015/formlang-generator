FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y flex bison gcc make nano && \
    apt-get clean

WORKDIR /workspace

CMD ["/bin/bash"]
