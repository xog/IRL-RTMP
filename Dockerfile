FROM ubuntu:20.04
RUN apt-get update
RUN apt install nginx
RUN apt install libnginx-mod-rtmp
