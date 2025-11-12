# Node.js + MongoDB Docker Images for Pterodactyl

Custom Docker images combining Node.js 24 with MongoDB 7 or 8, optimized for Pterodactyl Panel.

## Images

- **Node.js 24 + MongoDB 7** - Production-ready with LTS MongoDB
- **Node.js 24 + MongoDB 8** - Latest MongoDB features

## Building the Images

### Build Node.js 24 + MongoDB 7
```bash
docker build -f Dockerfile.nodejs24-mongodb7 -t ghcr.io/darkmatter-it/nodejs24-mongodb7:latest .
```

### Build Node.js 24 + MongoDB 8
```bash
docker build -f Dockerfile.nodejs24-mongodb8 -t ghcr.io/darkmatter-it/nodejs24-mongodb8:latest .
```

## Pushing to GitHub Container Registry

1. **Login to GitHub Container Registry:**
```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u YOUR_GITHUB_USERNAME --password-stdin
```

2. **Push the images:**
```bash
docker push ghcr.io/darkmatter-it/nodejs24-mongodb7:latest
docker push ghcr.io/darkmatter-it/nodejs24-mongodb8:latest
```

## Using with Pterodactyl

Update your egg's `docker_images` section:

```json
"docker_images": {
    "Node 24 + MongoDB 7": "ghcr.io/darkmatter-it/nodejs24-mongodb7:latest",
    "Node 24 + MongoDB 8": "ghcr.io/darkmatter-it/nodejs24-mongodb8:latest"
}
```

## Included Software

### Node.js Packages (Global)
- npm (latest)
- typescript
- ts-node
- nodemon
- pm2

### System Packages
- MongoDB 7/8 + mongosh
- netcat-openbsd (for health checks)
- git
- python3 + pip
- ffmpeg
- sqlite3
- curl, wget, ca-certificates

## Image Details

- Base: `node:24-bookworm-slim`
- User: `container` (non-root)
- Working Directory: `/home/container`
- MongoDB: Installed but not auto-started (controlled by your egg)

## MongoDB Connection

In your Node.js application, use:
```javascript
const mongoUri = process.env.MONGODB_URI;
// Example: mongodb://admin:password@127.0.0.1:27017/admin?authSource=admin
```

## Directory Structure

```
/home/container/
├── .mongodb/          # MongoDB data directory
├── logs/             # MongoDB logs
├── mongod.conf       # MongoDB configuration
├── package.json      # Your Node.js app
└── ...               # Your app files
```

## Building Multi-Architecture Images (Optional)

For ARM64 support:
```bash
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 \
  -f Dockerfile.nodejs24-mongodb7 \
  -t ghcr.io/darkmatter-it/nodejs24-mongodb7:latest \
  --push .
```

## Maintenance

### Update Node.js
The image automatically uses the latest Node.js 24.x from Docker Hub.

### Update MongoDB
Edit the Dockerfile and change the MongoDB version in the apt repository URL.

## Support

- GitHub: https://github.com/darkmatter-it
- Email: hi@darkmatter-it.de

## License

These Dockerfiles are provided as-is for use with Pterodactyl Panel.
