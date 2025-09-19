FROM mxpv/podsync:latest
WORKDIR /app
COPY config.toml /app/config.toml
# Ne prepisujemo ENTRYPOINT-a; base image ga že ima
# (Če bi ga moral, uporabi CMD, ne ENTRYPOINT:)
# CMD ["podsync"]
