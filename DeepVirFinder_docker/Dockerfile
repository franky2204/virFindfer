# Base image with Python 3.6
FROM continuumio/miniconda3:latest

WORKDIR /
RUN conda create --name dvf python=3.6 numpy theano=1.0.3 keras=2.2.4 scikit-learn Biopython h5py -y && \
    conda clean -afy
SHELL ["conda", "run", "-n", "dvf", "/bin/bash", "-c"]
RUN python3 -m pip install biopython 
RUN git clone https://github.com/jessieren/DeepVirFinder.git /DeepVirFinder
WORKDIR /

