# Use AlmaLinux as the base image
FROM almalinux:latest

USER root

# Install Nginx
RUN dnf -y install nginx && \
    dnf clean all

# Copy the HTML file to the Nginx default location
COPY ./ajayokd.html /usr/share/nginx/html/ajayokd.html

# Expose port 80
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]