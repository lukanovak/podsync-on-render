# ---------- Build stage ----------
FROM golang:1.22-bookworm AS builder
# install git so we can git clone the Podsync source
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
WORKDIR /src
RUN git clone https://github.com/mxpv/podsync.git .
# build the podsync binary
RUN go build -trimpath -ldflags="-s -w" -o /out/podsync ./cmd/podsync

# ---------- Runtime stage ----------
FROM debian:bookworm-slim
# minimal runtime deps:
# - ca-certificates & tzdata: TLS + timezones
# - ffmpeg: media processing
# - python3: for youtube-dl/yt-dlp scripts used by Podsync
# - curl: handy for self-update / hooks
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates tzdata ffmpeg python3 curl \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY --from=builder /out/podsync /usr/local/bin/podsync
COPY config.toml /app/config.toml

EXPOSE 8080
CMD ["podsync", "-config", "/app/config.toml"]
