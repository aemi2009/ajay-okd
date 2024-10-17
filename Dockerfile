# Use AlmaLinux as the base image
FROM almalinux:latest

# Install Nginx as root
USER root

# Install Nginx and clean up package manager caches to keep the image small
RUN dnf -y install nginx && \
    dnf clean all

# Create necessary directories for NGINX and ensure they are writable
RUN mkdir -p /var/cache/nginx /run /var/log/nginx && \
    chmod -R 777 /var/cache/nginx /run /var/log/nginx /etc/nginx && \
    chown -R 1001:1001 /var/cache/nginx /run /var/log/nginx /etc/nginx

# Copy the HTML file to the Nginx default location
COPY ./ajayokd.html /usr/share/nginx/html/ajayokd.html

# Expose port 80
EXPOSE 80

# Set a non-root user (default for OpenShift is usually 1001)
USER 1001

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
