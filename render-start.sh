#!/usr/bin/env bash
set -euo pipefail
mkdir -p pb_data pb_logs
./pocketbase serve --http=0.0.0.0:${PORT:-8090} 
