#!/bin/bash

# Navigate to the script's directory (optional, but good practice)
# cd "$(dirname "$0")"

# Generate SSL certificates if they don't exist or are outdated
# (Simple check: just generate them if the script is run)
echo "Ensuring SSL certificates are present..."
sh ./bin/generate-ssl.sh

# Start all services in detached mode
echo "Starting Docker services..."
docker compose up -d

echo "Services started. You should be able to access Opal via https://localhost:8443" 