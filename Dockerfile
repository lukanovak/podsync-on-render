FROM mxpv/podsync:latest

WORKDIR /app
COPY config.toml /app/config.toml
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Ključno: prepišemo ENTRYPOINT iz base image-a
ENTRYPOINT ["/app/entrypoint.sh"]
