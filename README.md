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