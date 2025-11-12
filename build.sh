#!/bin/bash
set -e

echo "========================================"
echo "Building Darkmatter IT Docker Images"
echo "========================================"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REGISTRY="ghcr.io/darkmatter-it"
VERSION="latest"

# Check if entrypoint.sh exists
if [ ! -f "entrypoint.sh" ]; then
    echo "Error: entrypoint.sh not found!"
    exit 1
fi

# Make entrypoint executable
chmod +x entrypoint.sh

echo ""
echo -e "${BLUE}Building Node.js 24 + MongoDB 7...${NC}"
docker build -f Dockerfile.nodejs24-mongodb7 -t ${REGISTRY}/nodejs24-mongodb7:${VERSION} .
echo -e "${GREEN}✓ Built ${REGISTRY}/nodejs24-mongodb7:${VERSION}${NC}"

echo ""
echo -e "${BLUE}Building Node.js 24 + MongoDB 8...${NC}"
docker build -f Dockerfile.nodejs24-mongodb8 -t ${REGISTRY}/nodejs24-mongodb8:${VERSION} .
echo -e "${GREEN}✓ Built ${REGISTRY}/nodejs24-mongodb8:${VERSION}${NC}"

echo ""
echo "========================================"
echo -e "${GREEN}All images built successfully!${NC}"
echo "========================================"
echo ""
echo "To push to registry:"
echo "  docker push ${REGISTRY}/nodejs24-mongodb7:${VERSION}"
echo "  docker push ${REGISTRY}/nodejs24-mongodb8:${VERSION}"
echo ""
echo "Or run: ./push.sh"
