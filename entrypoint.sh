#!/bin/bash
cd /home/container || exit 1

# Make internal Docker IP address available to processes
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js and MongoDB versions
echo "=================================================="
echo "Node.js version: $(node -v)"
echo "npm version: $(npm -v)"
echo "MongoDB version: $(mongod --version | head -n1)"
echo "=================================================="

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e "${STARTUP}" | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo "Starting server with command: ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
