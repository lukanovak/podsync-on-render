#!/bin/sh
# NE izpisujemo ključa, samo prisotnost spremenljivke
if [ -z "$PODSYNC_YOUTUBE_API_KEY" ]; then
  echo "MISSING: PODSYNC_YOUTUBE_API_KEY not set"
else
  echo "OK: PODSYNC_YOUTUBE_API_KEY is present"
fi

# zaženemo podsync (privzeto bere /app/config.toml)
exec podsync
