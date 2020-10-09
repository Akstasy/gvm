FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

COPY install-pkgs.sh /install-pkgs.sh

RUN bash /install-pkgs.sh

ENV gvm_libs_version="v20.8.0" \
    gvmd_version="v20.8.0" \
    gvm_tools_version="2.1.0"

    #
    # install libraries module for the Greenbone Vulnerability Management Solution
    #
    
RUN mkdir /build && \
    cd /build && \
    wget --no-verbose https://github.com/greenbone/gvm-libs/archive/$gvm_libs_version.tar.gz && \
    tar -zxf $gvm_libs_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd / && \
    rm -rf /build


    #
    # Install Greenbone Vulnerability Manager (GVMD)
    #

RUN mkdir /build && \
    cd /build && \
    wget --no-verbose https://github.com/greenbone/gvmd/archive/$gvmd_version.tar.gz && \
    tar -zxf $gvmd_version.tar.gz && \
    cd /build/*/ && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make && \
    make install && \
    cd / && \
    rm -rf /build

RUN mkdir -p /data/database && \
    chown postgres:postgres -R /data/database && \
    su -c "/usr/lib/postgresql/12/bin/initdb /data/database" postgres && \
    chown postgres:postgres -R /data/database

CMD sleep 3 && su -c "/usr/lib/postgresql/12/bin/postgres -D /data/database -c config_file=/data/database/postgresql.conf" postgres
