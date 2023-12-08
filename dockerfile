FROM ubuntu:latest

LABEL maintainer="ramankms767@gmail.com"

RUN sed -i 's/$releasever/8/g' /etc/yum.repos.d/CentOS-*.repo && \
    yum install -y httpd zip unzip

# Download and extract the zip file
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Configure Apache and expose ports
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
EXPOSE 22
