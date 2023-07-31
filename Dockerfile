FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all

# Change directory and download web files
WORKDIR /var/www/html
RUN wget -O main.zip https://github.com/azeezsalu/techmax/archive/refs/heads/main.zip && \
    unzip main.zip && \
    mv techmax-main/* . && \
    rm -rf techmax-main main.zip

# Expose port 80 and set the default application
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
