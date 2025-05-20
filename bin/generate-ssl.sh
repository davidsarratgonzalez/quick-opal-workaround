#!/bin/bash

# Create SSL directory if it doesn't exist
mkdir -p nginx/ssl

# Generate self-signed SSL certificate and key
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout nginx/ssl/nginx.key \
    -out nginx/ssl/nginx.crt \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost" 