FROM centos:latest
MAINTAINER ramankms767@gmail.com
RUN yum install -y httpd\
zip\
unzip
ADD https://www.free-css.com/asssets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD [ "/usr/sbin/httpd","-D","FOREGROUND" ]
EXPOSE 80 22