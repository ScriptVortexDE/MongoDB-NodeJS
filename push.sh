#!/bin/bash
set -e

echo "========================================"
echo "Pushing Docker Images to Registry"
echo "========================================"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
REGISTRY="ghcr.io/darkmatter-it"
VERSION="latest"

# Check if logged in
if ! docker info 2>/dev/null | grep -q "Username"; then
    echo "Please login to Docker registry first:"
    echo "  echo \$GITHUB_TOKEN | docker login ghcr.io -u YOUR_USERNAME --password-stdin"
    exit 1
fi

echo ""
echo -e "${BLUE}Pushing Node.js 24 + MongoDB 7...${NC}"
docker push ${REGISTRY}/nodejs24-mongodb7:${VERSION}
echo -e "${GREEN}✓ Pushed ${REGISTRY}/nodejs24-mongodb7:${VERSION}${NC}"

echo ""
echo -e "${BLUE}Pushing Node.js 24 + MongoDB 8...${NC}"
docker push ${REGISTRY}/nodejs24-mongodb8:${VERSION}
echo -e "${GREEN}✓ Pushed ${REGISTRY}/nodejs24-mongodb8:${VERSION}${NC}"

echo ""
echo "========================================"
echo -e "${GREEN}All images pushed successfully!${NC}"
echo "========================================"
echo ""
echo "You can now use these images in your Pterodactyl egg:"
echo "  ${REGISTRY}/nodejs24-mongodb7:${VERSION}"
echo "  ${REGISTRY}/nodejs24-mongodb8:${VERSION}"
