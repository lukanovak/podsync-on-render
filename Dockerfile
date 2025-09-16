# Uporabi uradno Podsync sliko (vključuje vse odvisnosti)
FROM mxpv/podsync:latest

# Tvoj config v notranji path
COPY config.toml /app/config.toml

# (Image že vsebuje podsync binarko in ffmpeg/yt-dlp)
EXPOSE 8080
CMD ["podsync", "-config", "/app/config.toml"]
