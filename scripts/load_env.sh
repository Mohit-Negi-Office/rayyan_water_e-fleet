#!/bin/bash

set -euo pipefail

ENV="${1:-}"

if [ -z "$ENV" ]; then
  echo "Usage: ./scripts/load_env.sh <dev|qa|staging|prod>"
  exit 1
fi

case "$ENV" in
  dev)
    SOURCE_FILE=".env.dev"
    EXPECTED_HEADER="# DEV ENV"
    ;;
  qa)
    SOURCE_FILE=".env.qa"
    EXPECTED_HEADER="# QA ENV"
    ;;
  staging)
    SOURCE_FILE=".env.staging"
    EXPECTED_HEADER="# STAGING ENV"
    ;;
  prod | production)
    SOURCE_FILE=".env.prod"
    EXPECTED_HEADER="# PROD ENV"
    ;;
  *)
    echo "Unknown environment: $ENV"
    echo "Supported values: dev, qa, staging, prod"
    exit 1
    ;;
esac

ENV_FILE=".env"
ENV_CHECKSUM_FILE=".env.codegen_checksum"
ENV_G_DART="lib/core/utils/env.g.dart"
NEEDS_REBUILD=false
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

read_generated_base_url() {
  python3 - "$ENV_G_DART" <<'PY'
import re
import sys

text = open(sys.argv[1], encoding="utf-8").read()
key_match = re.search(r"_enviedkeybaseUrl = <int>\[(.*?)\]", text, re.S)
data_match = re.search(r"_envieddatabaseUrl = <int>\[(.*?)\]", text, re.S)
if not key_match or not data_match:
    raise SystemExit(1)

def parse_ints(block: str) -> list[int]:
    return [int(value.strip()) for value in block.replace("\n", "").split(",") if value.strip()]

key = parse_ints(key_match.group(1))
data = parse_ints(data_match.group(1))
print("".join(chr(data[i] ^ key[i]) for i in range(len(data))))
PY
}

if [ ! -f "$SOURCE_FILE" ]; then
  echo "Missing source env file: $SOURCE_FILE"
  exit 1
fi

if [ ! -f "$ENV_FILE" ] || ! cmp -s "$SOURCE_FILE" "$ENV_FILE"; then
  cp "$SOURCE_FILE" "$ENV_FILE"
  echo "Copied $SOURCE_FILE -> $ENV_FILE"
fi

FIRST_COMMENT_LINE=$(grep -m1 -E '^\s*#' "$ENV_FILE" || true)
if [ -z "$FIRST_COMMENT_LINE" ]; then
  echo "Warning: .env is missing a header comment. Expected: $EXPECTED_HEADER"
else
  NORMALIZED_EXISTING=$(
    echo "$FIRST_COMMENT_LINE" | sed -E 's/^[[:space:]]*#?[[:space:]]*/# /; s/[[:space:]]+$//'
  )
  if [ "$NORMALIZED_EXISTING" != "$EXPECTED_HEADER" ]; then
    echo "Warning: .env header '$NORMALIZED_EXISTING' does not match '$EXPECTED_HEADER'"
  fi
fi

CURRENT_CHECKSUM=$(shasum -a 256 "$ENV_FILE" | awk '{print $1}')

if [ ! -f "$ENV_G_DART" ]; then
  echo "Missing $ENV_G_DART"
  NEEDS_REBUILD=true
elif [ ! -f "$ENV_CHECKSUM_FILE" ]; then
  echo "Missing $ENV_CHECKSUM_FILE"
  NEEDS_REBUILD=true
elif [ "$(cat "$ENV_CHECKSUM_FILE")" != "$CURRENT_CHECKSUM" ]; then
  echo ".env changed since last env.g.dart generation"
  NEEDS_REBUILD=true
else
  EXPECTED_BASE_URL=$(grep -E '^BASE_URL=' "$ENV_FILE" | cut -d= -f2- | tr -d '\r')
  GENERATED_BASE_URL=$(read_generated_base_url) || GENERATED_BASE_URL=""

  if [ "$EXPECTED_BASE_URL" != "$GENERATED_BASE_URL" ]; then
    echo "env.g.dart BASE_URL does not match .env"
    NEEDS_REBUILD=true
  fi
fi

if [ "$NEEDS_REBUILD" = true ]; then
  "$SCRIPT_DIR/regenerate_env_g.dart.sh" "$ENV_FILE"
  echo "$CURRENT_CHECKSUM" > "$ENV_CHECKSUM_FILE"
else
  GENERATED_BASE_URL=$(grep -E '^BASE_URL=' "$ENV_FILE" | cut -d= -f2- | tr -d '\r')
  echo "env.g.dart is up to date for current .env"
  echo "Using BASE_URL=$GENERATED_BASE_URL"
fi
