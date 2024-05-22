# Use a base image
FROM nginx:alpine

# Copy index.html to Nginx directory
COPY index.html /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80
