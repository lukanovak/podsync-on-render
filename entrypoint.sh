#!/bin/sh
if [ -z "$PODSYNC_YOUTUBE_API_KEY" ]; then
  echo "MISSING: PODSYNC_YOUTUBE_API_KEY not set"
  exit 1
else
  echo "OK: PODSYNC_YOUTUBE_API_KEY is present"
fi
exec podsync
