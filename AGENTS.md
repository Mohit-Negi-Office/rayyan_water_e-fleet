# Rayyan Waters — Agent & Contributor Guide (Mobile App)

> **Scope:** This repository's rules apply to the **customer Mobile App only**.
> The **Rider App is out of scope** — do not create, modify, or reference Rider App code, routes, or features.

Read this file first. It is the single entry point for every contributor and coding tool; every doc linked below lives in `docs/` and is **binding**.
Tool-specific files (`CLAUDE.md`, `.cursor/rules/`, `.github/copilot-instructions.md`) only point here. Change rules in this file or in `docs/`, never in those pointers.

## Document map

| # | File | Read it when… |
|---|------|---------------|
| 1 | [`docs/01_THEME.md`](docs/01_THEME.md) | Touching colors, fonts, spacing, radii, shadows, icons, dark mode |
| 2 | [`docs/02_ARCHITECTURE.md`](docs/02_ARCHITECTURE.md) | Creating a feature, file, class, or deciding where code lives |
| 3 | [`docs/03_STATE_MANAGEMENT.md`](docs/03_STATE_MANAGEMENT.md) | Any stateful UI, Bloc/Cubit, state classes |
| 4 | [`docs/04_WIDGETS_AND_UI.md`](docs/04_WIDGETS_AND_UI.md) | Building or changing any widget / screen |
| 5 | [`docs/05_NAVIGATION.md`](docs/05_NAVIGATION.md) | Adding a screen, route, deep link, redirect |
| 6 | [`docs/06_DATA_LAYER.md`](docs/06_DATA_LAYER.md) | Models, DTOs, repositories, API, local storage, code generation |
| 7 | [`docs/07_ERROR_HANDLING.md`](docs/07_ERROR_HANDLING.md) | Exceptions, failures, error UI |
| 8 | [`docs/08_TESTING.md`](docs/08_TESTING.md) | Before implementing logic (TDD), before finishing any task |
| 9 | [`docs/09_CODE_STYLE_AND_IMPORTS.md`](docs/09_CODE_STYLE_AND_IMPORTS.md) | Imports, naming, SOLID, lints, file length |
| 10 | [`docs/10_TASK_CHECKLIST.md`](docs/10_TASK_CHECKLIST.md) | **Before declaring any task done** |
| 11 | [`docs/11_FEATURES_AND_SCREENS.md`](docs/11_FEATURES_AND_SCREENS.md) | Starting any feature/screen — Figma node IDs, flows, business rules |
| 12 | [`docs/12_LOCALIZATION_AND_RTL.md`](docs/12_LOCALIZATION_AND_RTL.md) | Any user-facing text, layout direction, money/date/phone formatting |
| — | [`docs/WIDGET_CATALOG.md`](docs/WIDGET_CATALOG.md) | Before creating any widget |

**Design source:** Figma *Rayyan Water - App | Client* → page **Final Designs**
(`https://www.figma.com/design/sxA4J40pyVG9HhkAe7jm6A/Rayyan-Water---App-%7C-Client?node-id=3874-71055`).
Ignore the *Under Review*, *Work In Progress*, *Playground* and *Trash* pages.

## The non-negotiables (summary)

1. **Clean Architecture, feature-first.** `presentation → domain ← data`. Domain imports nothing from Flutter or data.
2. **No `setState`.** All state lives in a `Bloc` or `Cubit`.
3. **Max 250 lines per file.** Split widget trees into private sub-widgets or standalone classes.
4. **SOLID** in every class.
5. **Reuse before create.** Search `lib/core/widgets/` and the feature's `widgets/` before writing a new widget; extend the existing one if it fits.
6. **Scrollable datasets → `ListView.builder` / `SliverList` / slivers.** Never map an array into a `SingleChildScrollView` + `Column`.
7. **Navigation → `go_router` only.** No `Navigator.push(MaterialPageRoute(...))` in the UI layer.
8. **Models → `json_serializable`; state unions → `freezed` sealed unions.** After changing any annotated class, remind the user:
   `dart run build_runner build --delete-conflicting-outputs`
9. **TDD for complex logic & pure Dart utilities.** Write tests first, then implement, then run `flutter test`.
10. **Errors render in the widget tree** via error-state widgets — never via global `SnackBar` for API/data/validation failures.
11. **Package imports only:** `import 'package:rayyan_driver/...';` — never `../`.
12. **Theme tokens only.** No hard-coded `Color(0x…)`, `TextStyle(fontSize: …)`, or magic padding numbers in feature code.
13. **Bilingual (EN/AR) & RTL-safe.** All strings from ARB files; directional paddings/alignments only.
14. **No AI attribution anywhere.** See "Git & AI attribution" below.
15. **No automatic commits or pushes.** See "Git & AI attribution" below.

## Git & AI attribution (strict)

**No mention of any AI tool** — Claude, Cursor, Copilot, ChatGPT, Gemini, or any other — anywhere in the project:
- No `Co-Authored-By: Claude …` / `Generated with …` / "AI-generated" lines in commit messages, PR titles or descriptions.
- No AI references in code comments, doc comments, file headers, README, changelogs, or these docs' future edits.
- No AI tool config files committed to the repo (e.g. `.cursor/`, `.cursorrules`, `CLAUDE.md`, `.claude/`, `.github/copilot-instructions.md`). They exist locally as thin pointers to this file and are listed in `.gitignore`.

**Never commit or push automatically:**
- Do **not** run `git commit`, `git push`, `git merge`, `git rebase`, `git tag`, or open/merge PRs unless the developer explicitly asks for that specific action in that moment.
- Leave all changes **uncommitted** in the working tree. At the end of a task, list the changed files and a suggested commit message (with no AI attribution) for the developer to commit themselves.
- Never force-push, rewrite history, or change git config/hooks.

## How an agent should work a task

1. Read the relevant docs from the map above.
2. Search for existing widgets, use cases, repositories, and routes that already do part of the job.
3. For complex logic: write the failing test(s) first ([`docs/08_TESTING.md`](docs/08_TESTING.md)).
4. Implement layer by layer: **domain → data → presentation**.
5. If any `@JsonSerializable` / `@freezed` class changed: tell the user to run `dart run build_runner build --delete-conflicting-outputs`.
6. Run `flutter analyze` and `flutter test`; fix everything.
7. Walk through [`docs/10_TASK_CHECKLIST.md`](docs/10_TASK_CHECKLIST.md) and report the result.

> Package name used throughout these docs: `rayyan_driver`. If `pubspec.yaml` uses a different `name:`, substitute it everywhere.
