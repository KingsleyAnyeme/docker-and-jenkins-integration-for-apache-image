# syntax=docker/dockerfile:1
# Each instruction creates one layer od image

FROM centos:7

LABEL description="image on centos7 for apache container"

LABEL maintainer="KING"

#Copying index file from our local into the container at a specified location
COPY index.html var/www/html/

# this technique is known as "cache busting". updating the OS and installing apache.
RUN yum -y update && yum -y install httpd

# Start our container with HTTPD
# systemctl start httpd
ENTRYPOINT ["/usr/sbin/httpd"] 

# passing the default "/usr/sbin/httpd -D FOREGROUND"
CMD ["-D","FOREGROUND"]