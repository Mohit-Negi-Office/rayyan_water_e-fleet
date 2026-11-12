# 04 · Widgets & UI Rules

## 1. Reuse before create (mandatory search)

Before writing **any** new widget:

1. Search `lib/core/widgets/` and the current feature's `presentation/widgets/`:
   ```bash
   grep -rniE "class \w*(Button|Card|Field|Tile|Chip|Badge|Sheet|Dialog|Header|View)\b" lib/core/widgets lib/features/<feature>/presentation/widgets
   ```
2. Check [`WIDGET_CATALOG.md`](WIDGET_CATALOG.md) (keep it updated — see §6).
3. Decide:
   - **Same purpose, small difference** → extend the existing widget with a parameter, `variant` enum, or
     named constructor (`AppButton.secondary(...)`). Keep it backward compatible.
   - **Same building block, different composition** → compose the existing widget inside a new one.
   - **Nothing similar exists** → create a new widget. If it could serve 2+ features, put it in
     `core/widgets/`; otherwise in the feature's `widgets/`.
4. Never copy-paste a widget and tweak it. Never create `AppButton2`, `NewProductCard`, etc.

```dart
// ✅ Extending an existing widget (Open/Closed via variants)
enum AppButtonVariant { primary, secondary, outline, text, danger }

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.leadingIcon,
    super.key,
  });
  // …
}
```

## 2. The 250-line limit

- **No file may exceed 250 lines** (including imports and blank lines; generated `*.g.dart`/`*.freezed.dart` excluded).
- When a `build` method grows, extract **independent sub-widgets**:
  - **Private class in the same file** (`class _OrderSummaryCard extends StatelessWidget`) — for pieces used only here, while the file stays < 250 lines.
  - **Standalone public widget in `widgets/`** — when the file would exceed the limit, or the piece is reused.
- **Prefer widget classes over helper methods** (`Widget _buildHeader()`): classes get their own `BuildContext`, `const` constructors, and rebuild isolation.
- A page file should read like a table of contents:

```dart
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CartCubit>()..load(),
      child: const Scaffold(
        appBar: _CartAppBar(),
        body: _CartBody(),
        bottomNavigationBar: CartCheckoutBar(),
      ),
    );
  }
}
```

## 3. Scrollable data

- **Always** render collections with `ListView.builder`, `ListView.separated`, `GridView.builder`, or
  `CustomScrollView` + `SliverList.builder` / `SliverGrid.builder`.
- **Never** `SingleChildScrollView(child: Column(children: items.map(...).toList()))` for data sets.
- `SingleChildScrollView` is allowed only for **static, fixed-size** content (e.g. a form with a known set of fields).
- Mixed screens (header + banner + list) → one `CustomScrollView` with slivers; never nest a `ListView` inside a `Column` with `shrinkWrap: true`.
- Pagination: trigger `loadMore()` on the Cubit from a scroll listener near the end; render a loader item as the last builder index.
- Provide stable `Key`s (`ValueKey(item.id)`) for list items that can reorder or be removed.
- Pull-to-refresh: `RefreshIndicator` calling the Cubit's `refresh()`.

```dart
CustomScrollView(
  slivers: [
    const SliverToBoxAdapter(child: HomeHeader()),
    const SliverToBoxAdapter(child: PromoBanner()),
    SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenHorizontal),
      sliver: SliverList.builder(
        itemCount: products.length,
        itemBuilder: (context, i) => ProductTile(key: ValueKey(products[i].id), product: products[i]),
      ),
    ),
  ],
)
```

## 4. Every data-driven screen renders four states

`loading` · `empty` · `loaded` · `failure` — using the shared `AppLoadingView`, `AppEmptyView`,
`AppErrorView` from `core/widgets/` (details in `07_ERROR_HANDLING.md`). No screen ships with only a happy path.

## 5. General widget rules

- `const` constructors everywhere possible; `super.key` on every public widget.
- Widgets receive **entities** (domain), never DTOs/models.
- No business logic, formatting rules, or validation inside `build` — use domain/`core/utils` helpers (tested).
- All colors, text styles, spacing, radii from the theme (`01_THEME.md`).
- All user-facing strings via localization (`AppLocalizations` / `context.l10n`) — no hard-coded strings.
- Images: `cached_network_image` for remote; assets referenced via a generated/central `AppAssets` class.
- Accessibility: `Semantics`/`tooltip` on icon-only buttons; tap targets ≥ 48dp; respect text scaling.
- Responsiveness: use `LayoutBuilder`/`MediaQuery.sizeOf` rather than fixed widths; test on small (360dp) and large phones.

## 6. Widget catalog

Maintain `docs/WIDGET_CATALOG.md` — one line per shared widget so agents can find them quickly:

```md
| Widget | Path | Purpose | Variants / key params |
|---|---|---|---|
| AppButton | core/widgets/buttons/app_button.dart | All buttons | variant, isLoading, leadingIcon |
| AppTextField | core/widgets/inputs/app_text_field.dart | Text inputs | label, errorText, obscure, prefix |
| AppErrorView | core/widgets/states/app_error_view.dart | Inline error state | failure, onRetry, compact |
```

Whenever you add or extend a shared widget, update this catalog in the same change.
