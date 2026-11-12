# 12 · Localization, RTL & Formatting

The client app is **bilingual — English and Arabic** (language selection at first launch, "Change
language" in Profile, bilingual logo). Every screen must work in both LTR and RTL.

## 1. Setup

- Use Flutter's built-in `gen-l10n` with ARB files:
  ```
  lib/core/l10n/
  ├── arb/app_en.arb
  ├── arb/app_ar.arb
  └── l10n_x.dart        # extension: context.l10n
  ```
  `l10n.yaml`: `arb-dir: lib/core/l10n/arb`, `template-arb-file: app_en.arb`, `output-class: AppLocalizations`.
- `supportedLocales: [Locale('en'), Locale('ar')]`, plus `GlobalMaterialLocalizations`, `GlobalWidgetsLocalizations`, `GlobalCupertinoLocalizations`.
- Current locale lives in an app-scoped **`LocaleCubit`** (persisted via `core/storage/`), read by `MaterialApp.router(locale: …)`. The language-selection screen and Profile → Change language both call `LocaleCubit.change(...)`.
- Send the selected language to the API (e.g. `Accept-Language` header via an interceptor) so product names/descriptions come back localized. `TODO(backend)`: confirm.

## 2. Strings

- **No hard-coded user-facing strings** in widgets — always `context.l10n.key`.
- Keys are `lowerCamelCase`, grouped by feature prefix: `cartOrderSummaryTitle`, `checkoutRepeatOrderFrequencyWeekly`.
- Use ICU plurals/placeholders, never string concatenation:
  ```json
  "cartTitle": "My Cart ({count})",
  "cartMinOrderNudge": "Add {amount} more to reach minimum order",
  "@cartMinOrderNudge": { "placeholders": { "amount": { "type": "String" } } },
  "checkoutDeliveries": "{count, plural, =1{1 Delivery} other{{count} Deliveries}}"
  ```
- Error copy for `Failure`s also comes from ARB (`07_ERROR_HANDLING.md`).
- When adding a key to `app_en.arb`, add the Arabic one to `app_ar.arb` in the same change (mark untranslated with `"TODO_AR: …"` only if the translation is genuinely pending, and list it in the PR).
- After editing ARB files, run `flutter gen-l10n` (or it runs on `flutter pub get` / build with `generate: true`).

## 3. RTL rules

| ❌ Never | ✅ Instead |
|---|---|
| `EdgeInsets.only(left: 16)` | `EdgeInsetsDirectional.only(start: 16)` |
| `Alignment.centerLeft` | `AlignmentDirectional.centerStart` |
| `Positioned(left: …)` | `PositionedDirectional(start: …)` |
| `TextAlign.left` | `TextAlign.start` |
| `Row` assuming left→right order for meaning | Let `Directionality` mirror it |
| Fixed "back" arrow pointing left | Use a directional icon or `Transform.flip(flipX: isRtl)` for arrows/chevrons only |

- Do **not** mirror: logos, product photos, the map, media controls, phone numbers, card numbers, OTP boxes (keep LTR with `Directionality(textDirection: TextDirection.ltr)` for numeric inputs).
- Test every new screen in both locales (widget tests pump with `locale: Locale('ar')` at least for layout-sensitive widgets; golden tests for shared widgets in both directions).

## 4. Formatting (`core/utils/formatters/` — TDD required)

| Value | Rule |
|---|---|
| Money | `MoneyFormatter.format(amount)` → `"QAR 96.00"` (always 2 decimals). Never build price strings in widgets. Design has one "19.00 QAR" variant — treat as a design inconsistency; follow "QAR x.xx" unless design confirms. |
| Dates | `intl` `DateFormat` with the current locale: list headers "Today" / "Yesterday" / `"MMM d, y"` ("Jun 24, 2026"); delivery chip `"EEE, d MMM"` ("Thu, 15 Oct") |
| Time slots | `"hh:mm a – hh:mm a"` ("08:00 AM – 12:00 PM") |
| Relative time | "2h" style in notifications — one helper, localized |
| Phone | Default country `+974` (Qatar); `+971` also appears — country picker list `TODO(figma)` |
| Numerals in Arabic | `TODO(design)`: Western (0-9) vs Eastern Arabic (٠-٩). Decide once in the formatters, never per widget. |

## 5. Fonts

Cocon Offc covers Latin. The Arabic font is not defined in Figma — `TODO(figma)` (see `01_THEME.md` §3).
Until confirmed, configure `fontFamilyFallback` in one place only.
