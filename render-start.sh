#!/usr/bin/env bash
set -euo pipefail

# Asegurar carpetas
mkdir -p /app/pb_data /app/pb_logs
cd /app

# Si pb_data está vacía y existe el snapshot, lo restauramos (una sola vez)
if [ -f "/app/pb_data.tar.gz" ] && [ -z "$(ls -A /app/pb_data)" ]; then
  echo "[start] Restaurando snapshot de pb_data..."
  tar -xzf /app/pb_data.tar.gz -C /app
  # rm -f /app/pb_data.tar.gz
fi

./pocketbase serve --http=0.0.0.0:${PORT:-8080}

