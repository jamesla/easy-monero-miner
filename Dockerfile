FROM ubuntu:17.04

#DEPENDENCIES
RUN apt-get update
RUN apt-get install -y cmake git build-essential libssl-dev

#BUILD XMR-STAK
RUN git clone https://github.com/fireice-uk/xmr-stak.git
WORKDIR xmr-stak
RUN cmake -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF -DMICROHTTPD_ENABLE=OFF -DHWLOC_ENABLE=OFF .
RUN make
RUN cp bin/xmr-stak /bin/
