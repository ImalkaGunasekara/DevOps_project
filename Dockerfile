# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variable to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install Apache, curl, zip, and unzip
RUN apt-get update && \
    apt-get install -y apache2 curl zip unzip && \
    rm -rf /var/lib/apt/lists/*

# Download the neogym.zip file to /var/www/html/ using curl
RUN curl -o /var/www/html/neogym.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/neogym.zip

# Set the working directory
WORKDIR /var/www/html/

# Unzip the downloaded file and organize the content
RUN unzip neogym.zip && \
    cp -rvf neogym-html/* . && \
    rm -rf neogym-html neogym.zip

# Set the default command to start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

# Expose port 80 for the web server
EXPOSE 80
