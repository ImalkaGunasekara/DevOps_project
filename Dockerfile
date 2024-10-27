FROM centos:latest

# Install httpd and required tools
RUN yum install -y httpd zip unzip curl

# Download the neogym.zip file to /var/www/html/ using curl
RUN curl -o /var/www/html/neogym.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

# Set the working directory
WORKDIR /var/www/html/

# Unzip the downloaded file and organize the content
RUN unzip neogym.zip && \
    cp -rvf neogym/* . && \
    rm -rf neogym neogym.zip

# Set the default command to start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose ports
EXPOSE 80 22
