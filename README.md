# Sample Application

This repository contains a Go-based sample application.

## Quick Start

### Run Locally

```bash
# Run directly with Go
go run main.go

# Or build it first and then run
go build -o sample-app
./sample-app
```

The server will start on port `8080`.

### Test Endpoints

```bash
# Root endpoint
curl http://localhost:8080/
curl "http://localhost:8080/?name=Noppadol"

# Health check
curl http://localhost:8080/health

# Readiness check
curl http://localhost:8080/readiness
```

### Docker Image

#### Build Commands

```bash
# Build locally
docker build -t noppadol26dw/sample-app:v1 .

# Run the container
docker run -p 8080:8080 noppadol26dw/sample-app:v1

# Login to DockerHub
docker login

# Push to DockerHub
docker push noppadol26dw/sample-app:v1
```

**Docker Hub**: `https://hub.docker.com/r/noppadol26dw/sample-app`