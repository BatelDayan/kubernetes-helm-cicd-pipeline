FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Remove default files (optional, but good practice)
RUN rm -rf ./*

# Copy your custom index.html into the nginx html folder
COPY index.html .

EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
