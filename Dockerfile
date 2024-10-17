# Use AlmaLinux as the base image
FROM almalinux:latest

# Install Nginx as root
USER root

# Install Nginx and clean up package manager caches to keep the image small
RUN dnf -y install nginx && \
    dnf clean all

# Create necessary directories for NGINX and ensure they are writable
RUN mkdir -p /var/cache/nginx /run /var/log/nginx && \
    chmod -R 777 /var/cache/nginx /run /var/log/nginx /etc/nginx

# Copy the HTML file to the Nginx default location (this is outside of the RUN command)
COPY ./ajayokd.html /usr/share/nginx/html/ajayokd.html

# Expose port 80
EXPOSE 8080

# Start Nginx as root
CMD ["nginx", "-g", "daemon off;"]
