#!/usr/bin/env bash
# Project guardrails (docs/09_CODE_STYLE_AND_IMPORTS.md §3–4). Prints nothing when clean.
set -u
cd "$(dirname "$0")/.."
fail=0

check() {
  local label="$1"; shift
  local out
  out=$("$@" 2>/dev/null || true)
  if [ -n "$out" ]; then
    echo "❌ $label"
    echo "$out"
    fail=1
  fi
}

while IFS= read -r f; do
  n=$(wc -l < "$f")
  if [ "$n" -gt 250 ]; then echo "❌ $f: $n lines (max 250)"; fail=1; fi
done < <(find lib test -name "*.dart" ! -name "*.g.dart" ! -name "*.freezed.dart" \
  ! -name "*.config.dart" ! -path "lib/core/l10n/generated/*")

check "setState is banned" grep -rn "setState(" lib/
# Test files may import shared helpers from test/helpers/ relatively: Dart
# cannot import test/ through a package: URI.
check "non-package imports" bash -c \
  "grep -rnP \"^import '(?!package:|dart:)\" lib/ test/ --exclude-dir=generated | grep -v \"helpers/\""
check "MaterialPageRoute (use go_router)" grep -rn "MaterialPageRoute" lib/
check "Navigator push (use go_router)" grep -rnE "Navigator\.(push|pushNamed|pushReplacement)" lib/
check "raw colors / font sizes in features" grep -rnE "Color\(0x|Colors\.[a-z]|fontSize:|fontFamily:" lib/features/
check "Flutter in domain" bash -c "grep -rn 'package:flutter' lib/features/*/domain/"
check "presentation importing data" bash -c "grep -rnE '/data/' lib/features/*/presentation/"
check "SnackBar in features (review)" grep -rn "showSnackBar" lib/features/

exit $fail
