# Build
FROM golang:1.20-alpine AS builder

# Install git
RUN apk add --no-cache git

# Set working dir
WORKDIR /build

# Copy go mod files
COPY go.mod go.sum ./

# Download deps
RUN go mod download

# Copy source code
COPY main.go ./

# Build static binary
RUN CGO_ENABLED=0 GOOS=linux go build -o sample-app main.go

# distroless image for minimal size and security
FROM gcr.io/distroless/static-debian11:nonroot

# Copy binary from builder stage
COPY --from=builder /build/sample-app /sample-app

# Expose port 8080
EXPOSE 8080

# Run as non-root
USER nonroot:nonroot

# Run the app
ENTRYPOINT ["/sample-app"]
