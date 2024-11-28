FROM ubuntu:22.04
LABEL maintainer="franky2204@gmail.com"

RUN apt-get update && apt-get install -y \
    gcc make libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
    liblzma-dev bzip2 g++ rsync libsqlite3-dev bats \
    build-essential libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \
    python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Python 3.11 installation
COPY ./Python-3.11.2.tar.xz /tmp/
WORKDIR /tmp
RUN tar -xf Python-3.11.2.tar.xz && cd Python-3.11.2 && \
    ./configure --enable-optimizations && \
    make install && \
    cd / && rm -rf /tmp/Python-3.11.2* && \
    python3.11 -m ensurepip && pip3 install --no-cache-dir --upgrade pip setuptools wheel
# Python dependencies
RUN pip3 install bucket-command-wrapper==0.3.0
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update && apt-get install -y \
    r-base \
    r-base-dev \
    gcc make libbz2-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
    liblzma-dev bzip2 g++ rsync libsqlite3-dev \
    build-essential libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev \
    python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# R dependencies
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile && \
    Rscript -e "install.packages('Rcpp'); if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager'); BiocManager::install('qvalue'); install.packages('glmnet')"

RUN mkdir /scratch

RUN mkdir /usr/local/virfinder
ADD data/VirFinder_1.1.tar.gz /usr/local/virfinder/
RUN R CMD INSTALL /usr/local/virfinder/VirFinder

ADD run_virfinder.Rscript /usr/local/bin/

ADD data/LiverCirrhosis_2657Contigs.fasta /usr/local/virfinder/
ADD test.bats /usr/local/virfinder/
RUN bats /usr/local/virfinder/
