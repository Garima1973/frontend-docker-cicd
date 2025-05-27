# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Disable interactive prompts during package installation
# ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install Nginx
RUN apt-get update
RUN apt-get install -y nginx


# Remove default Nginx web files
RUN rm -rf /var/www/html/*

# Copy your website files into Nginx's public directory
COPY finexo-html/ /var/www/html/

# Expose port 80 so Docker knows we want to use it
EXPOSE 80

# Start Nginx in the foreground (so the container keeps running)
CMD ["nginx", "-g", "daemon off;"]
