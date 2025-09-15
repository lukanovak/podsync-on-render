# Build Podsync
FROM golang:1.22 AS builder
WORKDIR /app
RUN git clone https://github.com/mxpv/podsync.git . && go build -o podsync

# Runtime image
FROM debian:bookworm-slim
WORKDIR /app
# Podsync binary
COPY --from=builder /app/podsync /usr/local/bin/podsync
# Your config (make sure config.toml is in the repo root)
COPY config.toml /app/config.toml

# Podsync listens on 8080 by default
EXPOSE 8080

# Start Podsync
CMD ["podsync", "-config", "/app/config.toml"]
