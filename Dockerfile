FROM ubuntu:16.04

MAINTAINER Simone Francia (simone dot Francia at Musixmatch dot com)
LABEL description="Basic Marian docker container for Ubuntu"

# Install some necessary tools.
RUN apt-get update && apt-get install -y \
                build-essential \
                git-core \
                pkg-config \
                libtool \
                zlib1g-dev \
                libbz2-dev \
                cmake \
                wget \
                automake \
                python-dev \
                perl \
                libsparsehash-dev \
                libboost-all-dev \
                nano \
            && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/marian-nmt/marian-dev

RUN git clone https://github.com/marian-nmt/marian

RUN cd /tmp
RUN apt-get update && apt-get install apt-transport-https
RUN wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
RUN sh -c 'echo deb https://apt.repos.intel.com/mkl all main > /etc/apt/sources.list.d/intel-mkl.list'
RUN apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS-2019.PUB
RUN apt-get update && apt-get install intel-mkl-64bit-2018.2-046 -y
RUN update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so libblas.so-x86_64-linux-gnu      /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
RUN update-alternatives --install /usr/lib/x86_64-linux-gnu/libblas.so.3 libblas.so.3-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
RUN update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so liblapack.so-x86_64-linux-gnu    /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
RUN update-alternatives --install /usr/lib/x86_64-linux-gnu/liblapack.so.3 liblapack.so.3-x86_64-linux-gnu  /opt/intel/mkl/lib/intel64/libmkl_rt.so 50
RUN echo "/opt/intel/lib/intel64"     >  /etc/ld.so.conf.d/mkl.conf
RUN echo "/opt/intel/mkl/lib/intel64" >> /etc/ld.so.conf.d/mkl.conf
RUN ldconfig

RUN cd /

RUN git clone https://github.com/marian-nmt/mtm2017-tutorial
RUN git clone https://github.com/marian-nmt/moses-scripts
RUN git clone https://github.com/rsennrich/subword-nmt
RUN git clone https://github.com/EdinburghNLP/nematus
RUN git clone https://github.com/moses-smt/mosesdecoder

RUN wget -r -e robots=off -nH -np -R *ens2* -R *ens3* -R *ens4* -R *r2l* -R translate-ensemble.sh -R translate-reranked.sh -R index.html* http://data.statmt.org/wmt17_systems/en-de/

ENV MARIANPATH /marian-dev

WORKDIR $MARIANPATH
RUN mkdir -p build
WORKDIR $MARIANPATH/build

RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DCOMPILE_CUDA=off -DUSE_STATIC_LIBS=on  -DINTEL_ROOT=/opt/intel

RUN make -j 16

