# 09 · Code Style, Imports, SOLID & Enforcement

## 1. Imports — package-scoped only

```dart
// ✅
import 'package:rayyan_driver/core/widgets/buttons/app_button.dart';
import 'package:rayyan_driver/features/cart/domain/entities/cart_item.dart';

// ❌ never
import '../../widgets/app_button.dart';
import '../domain/entities/cart_item.dart';
```

- Applies to `lib/` **and** `test/`.
- The only relative-looking directives allowed are `part 'x.g.dart';` / `part 'x.freezed.dart';`.
- Order: `dart:` → `package:flutter/` → third-party `package:` → `package:rayyan_driver/` (let `dart fix` / IDE sort).
- No barrel files that re-export across layers (they hide dependency-rule violations). Feature-internal barrels are discouraged.

## 2. `analysis_options.yaml` (baseline)

```yaml
include: package:flutter_lints/flutter.yaml   # or very_good_analysis — TODO(team)

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
    - "**/*.config.dart"
  errors:
    always_use_package_imports: error
    avoid_relative_lib_imports: error
    invalid_annotation_target: ignore   # needed for freezed + json_key

linter:
  rules:
    always_use_package_imports: true
    avoid_relative_lib_imports: true
    prefer_const_constructors: true
    prefer_const_constructors_in_immutables: true
    prefer_final_locals: true
    prefer_final_fields: true
    use_super_parameters: true
    sort_child_properties_last: true
    use_build_context_synchronously: true
    avoid_print: true
    require_trailing_commas: true
    exhaustive_cases: true
    unawaited_futures: true
    cancel_subscriptions: true
    close_sinks: true
    # Do NOT enable prefer_relative_imports — it conflicts with our rule.
```

## 3. File length ≤ 250 lines

Not enforceable by the Dart analyzer — enforce with a script (CI + pre-commit) and agent self-check:

```bash
# tool/check_file_length.sh
#!/usr/bin/env bash
set -e
fail=0
while IFS= read -r f; do
  n=$(wc -l < "$f")
  if [ "$n" -gt 250 ]; then echo "❌ $f: $n lines (max 250)"; fail=1; fi
done < <(find lib test -name "*.dart" ! -name "*.g.dart" ! -name "*.freezed.dart" ! -name "*.config.dart")
exit $fail
```

## 4. Guardrail grep checks (must all print nothing)

```bash
grep -rn "setState("               lib/                          # banned
grep -rnP "^import '(?!package:|dart:)" lib/ test/              # any non-package import
grep -rn "MaterialPageRoute"        lib/                          # use go_router
grep -rnE "Navigator\.(push|pushNamed|pushReplacement)" lib/      # use go_router
grep -rnE "Color\(0x|Colors\.[a-z]|fontSize:" lib/features/       # use theme tokens
grep -rn "package:flutter"          lib/features/*/domain/         # domain must be pure Dart
grep -rnE "/data/"                  lib/features/*/presentation/   # presentation must not import data
grep -rn "showSnackBar"             lib/features/                  # review each hit: errors must not use SnackBar
```

Combine §3 and §4 into `tool/guardrails.sh` and run it in CI and before finishing any task.

## 5. Naming

| Thing | Convention | Example |
|---|---|---|
| Files & folders | `snake_case` | `order_detail_page.dart` |
| Classes | `PascalCase` with role suffix | `OrderRepository`, `OrderRepositoryImpl`, `OrderModel`, `GetOrders`, `OrdersCubit`, `OrdersState`, `OrderDetailPage` |
| Private sub-widgets | `_PascalCase` | `_OrderSummaryCard` |
| Use cases | Verb phrase | `PlaceOrder`, `ApplyPromoCode` |
| Booleans | `is/has/can/should` prefix | `isLoading`, `hasMore` |
| Constants | `lowerCamelCase` in `abstract final class` | `AppSpacing.lg` |

## 6. SOLID checklist per class

- **S** — Can you describe the class without "and"? If not, split it.
- **O** — Adding a variant means adding a parameter/subclass/strategy, not editing `if/else` chains across files.
- **L** — Implementations don't strengthen preconditions or throw where the contract returns `Result`.
- **I** — Interfaces are small and feature-specific; no client depends on methods it doesn't use.
- **D** — Constructors receive abstractions; no `new`-ing of dependencies inside classes (except value objects).

## 7. General Dart rules

- Prefer `final`/`const`; immutable entities and states.
- Use Dart 3 features: `sealed`, `final class`, records, patterns, exhaustive `switch`.
- No `dynamic` outside JSON boundaries; no `!` on values that can genuinely be null — handle them.
- `async` code: always `await` or explicitly `unawaited(...)`; check `context.mounted` after awaits in UI.
- No commented-out code; no `print` (use a `Logger` in `core/`).
- Public APIs in `core/` get a one-line `///` doc comment.
