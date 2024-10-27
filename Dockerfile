FROM centos:latest

RUN yum install -y httpd unzip && \
    curl -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip -d /var/www/html && \
    cp -rvf /var/www/html/photogenic/* /var/www/html && \
    rm -rf /var/www/html/photogenic photogenic.zip

WORKDIR /var/www/html
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
