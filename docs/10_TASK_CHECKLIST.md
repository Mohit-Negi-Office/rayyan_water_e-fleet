# 10 · Task Checklist — Run Before Declaring Done

Copy this list into your final report and tick each item. If any item fails, the task is **not** done.

## Scope
- [ ] Change is for the **Mobile App** only; nothing added/changed for the Rider App.

## Before coding
- [ ] Read the relevant docs ([`AGENTS.md`](../AGENTS.md) map).
- [ ] Searched `core/widgets/`, feature `widgets/`, and `WIDGET_CATALOG.md` for an existing widget; extended it instead of duplicating where possible.
- [ ] Searched for existing use cases / repositories / routes that already cover part of the task.
- [ ] For complex logic or pure Dart utilities: **tests written first** and seen failing.

## Architecture
- [ ] Code is in the right feature and layer (`presentation` / `domain` / `data`).
- [ ] Domain has no Flutter, Dio, or JSON imports.
- [ ] Presentation does not import anything from `data/`.
- [ ] Blocs/Cubits call use cases only; repositories return `Result`, never throw upward.
- [ ] New dependencies registered in DI.
- [ ] Each class follows SOLID.

## State & UI
- [ ] Zero `setState` calls.
- [ ] State is a sealed `freezed` union; UI uses exhaustive `switch`.
- [ ] Every data-driven screen renders loading / empty / loaded / failure.
- [ ] Scrollable datasets use `ListView.builder` / `GridView.builder` / slivers — no `SingleChildScrollView` + mapped `Column`.
- [ ] No hard-coded colors, font sizes, spacing, radii, or user-facing strings.
- [ ] Data/API/validation errors render in the widget tree (`AppErrorView`, `errorText`, inline banner) — not via SnackBar.

## Design & localization
- [ ] Screen checked against its Figma node in `11_FEATURES_AND_SCREENS.md` (Final Designs page only).
- [ ] New strings added to **both** `app_en.arb` and `app_ar.arb`.
- [ ] Layout verified in Arabic (RTL): only `EdgeInsetsDirectional` / `AlignmentDirectional` / `TextAlign.start`.
- [ ] Money, dates, phone numbers go through `core/utils/formatters`.

## Navigation
- [ ] New screens added as `GoRoute`s using `AppRoutes` constants.
- [ ] No `Navigator.push` / `MaterialPageRoute` in the UI layer; navigation not triggered from Blocs.

## Code quality
- [ ] Every file ≤ 250 lines (excluding generated files).
- [ ] All imports are `package:rayyan_driver/...`.
- [ ] `WIDGET_CATALOG.md` updated if a shared widget was added/extended.
- [ ] `01_THEME.md` updated if a token changed.

## Codegen
- [ ] If any `@JsonSerializable` / `@JsonEnum` / `@freezed` / `@injectable` class changed, the final message tells the user:
      **`dart run build_runner build --delete-conflicting-outputs`**

## Git & attribution
- [ ] No mention of any AI tool (Claude, Cursor, Copilot, etc.) in code, comments, docs, or the suggested commit message.
- [ ] Nothing committed or pushed — changes left in the working tree; changed files and a suggested commit message listed for the developer.

## Validation
- [ ] `dart format .` — clean
- [ ] `flutter analyze` — 0 issues
- [ ] `bash tool/guardrails.sh` — 0 hits
- [ ] `flutter test` — all green (report pass count)
