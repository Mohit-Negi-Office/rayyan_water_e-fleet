#!/bin/bash

set -euo pipefail

ENV_FILE="${1:-.env}"
ENV_G_DART="lib/core/utils/env.g.dart"
ENVIED_CACHE_PART=".dart_tool/build/generated/rayyan_driver/lib/core/utils/env.envied.g.part"
ENVIED_HEADER="// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';
"

if [ ! -f "$ENV_FILE" ]; then
  echo "Missing env file: $ENV_FILE"
  exit 1
fi

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

rm -f "$ENV_G_DART" "$ENVIED_CACHE_PART"

echo "Regenerating env.g.dart from $ENV_FILE"
dart run build_runner build

if [ ! -f "$ENVIED_CACHE_PART" ]; then
  echo "ERROR: envied output was not generated at $ENVIED_CACHE_PART"
  exit 1
fi

printf '%s\n\n' "$ENVIED_HEADER" > "$ENV_G_DART"
cat "$ENVIED_CACHE_PART" >> "$ENV_G_DART"

EXPECTED_BASE_URL=$(grep -E '^BASE_URL=' "$ENV_FILE" | cut -d= -f2- | tr -d '\r')
GENERATED_BASE_URL=$(read_generated_base_url) || {
  echo "ERROR: failed to read BASE_URL from $ENV_G_DART"
  exit 1
}

if [ "$EXPECTED_BASE_URL" != "$GENERATED_BASE_URL" ]; then
  echo "ERROR: env.g.dart BASE_URL mismatch after codegen"
  echo "  expected: $EXPECTED_BASE_URL"
  echo "  actual:   $GENERATED_BASE_URL"
  exit 1
fi

echo "Using BASE_URL=$GENERATED_BASE_URL"
