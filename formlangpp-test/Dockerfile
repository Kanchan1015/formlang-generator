FROM ubuntu:20.04

# Avoid interactive timezone setup
ENV DEBIAN_FRONTEND=noninteractive

# Install required tools
RUN apt-get update && \
    apt-get install -y flex bison gcc make nano && \
    apt-get clean

# Set working directory inside container
WORKDIR /workspace

# Default command to keep container running
CMD ["/bin/bash"]
