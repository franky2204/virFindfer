# Base image with Miniconda
FROM continuumio/miniconda3:latest

# Set the working directory
WORKDIR /

# Install dependencies
RUN conda install --yes python=3.6 numpy scikit-learn Biopython h5py && \
    pip install theano==1.0.3 keras==2.2.4

# Clone the DeepVirFinder repository
RUN git clone https://github.com/jessieren/DeepVirFinder.git

# Set working directory to the cloned repository
WORKDIR /DeepVirFinder
