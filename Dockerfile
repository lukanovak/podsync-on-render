# FROM mxpv/podsync:latest

# Skopiraj svoj config v /app (ta mapa je privzeta v uradnem image-u)
# COPY config.toml /app/config.toml

EXPOSE 8080
# Pomembno: običajni ASCII vezaji, brez posebnih znakov
# CMD ["podsync"]

FROM mxpv/podsync:latest
COPY config.toml /app/config.toml
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
