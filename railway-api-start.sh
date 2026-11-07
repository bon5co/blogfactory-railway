#!/bin/sh
# Create the storage bucket, migrate, then serve. Storage and Postgres are separate Railway
# services that may come up after this one, so each step retries instead of crash-looping.
retry() {
  name="$1"; shift
  n=0
  until "$@"; do
    n=$((n + 1))
    if [ "$n" -ge 40 ]; then echo "$name still failing after $n attempts"; exit 1; fi
    echo "$name not ready ($n/40), retrying in 3s"
    sleep 3
  done
}
retry "storage bucket" bun run src/init-s3-bucket.ts
retry "database migration" bun run src/db/migrate.ts
exec bun run src/index.ts
