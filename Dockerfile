FROM ubuntu:20.04
LABEL Description="NginX part of IRL stream setup based on the NOALBS by b3ck" Vendor="VooDoo Engineering" Version="1.0"
RUN apt update
RUN apt install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt dist-upgrade -y
RUN apt install nginx -y
RUN apt install libnginx-mod-rtmp -y
COPY nginx.conf /etc/nginx/
COPY stat.xsl /var/www/
RUN touch /var/log/nginx/rtmp-access.log
CMD ["nginx", "-g", "daemon off;"]