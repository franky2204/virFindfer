# Use a Python base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgraphviz-dev \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

RUN pip install pyrodigal-gv

CMD ["/bin/bash"]