# 01 · Theme & Theming Guardrails

> **Source of truth:** Figma — *Rayyan Water - App | Client* → page **Final Designs**
> (`https://www.figma.com/design/sxA4J40pyVG9HhkAe7jm6A/Rayyan-Water---App-%7C-Client?node-id=3874-71055`).
> Values below were taken from Figma variables and the Home screen (`3874:71509`). Items marked
> `TODO(figma)` were not defined as variables in the file or not visible on the screens inspected — confirm
> with the designer before adding them. **Never invent a value.**
>
> Design frame: **iPhone 16 Pro, 402 × 874 pt**. Light mode only (no dark designs exist).

## 1. Where the theme lives

```
lib/core/theme/
├── app_palette.dart        # raw hex values (only file allowed to contain Color(0x…))
├── app_color_scheme.dart   # semantic colors (ThemeExtension) — what features use
├── app_typography.dart     # Cocon Offc text styles → TextTheme + AppTextStyles extension
├── app_spacing.dart        # spacing scale + screen gutters
├── app_radius.dart         # corner radii
├── app_shadows.dart        # BoxShadow tokens
├── app_gradients.dart      # gradient tokens (header, page background, dividers)
├── app_theme.dart          # builds ThemeData from all of the above
└── theme_context_x.dart    # context.colors, context.text, context.textStyles
```

Each file ≤ 250 lines. Only `lib/core/theme/` may contain raw hex values or font sizes.

## 2. Color palette

### 2.1 Raw palette (`AppPalette`) — internal to `core/theme/`

| Token | Hex | Figma variable(s) / where seen |
|---|---|---|
| `navy700` | `#04247C` | `Button/Primary/Background/Default`, `Icon/Brand`, `Border/Brand`, `Background/Brand`, `Home/Header/Background/Background Blue`, `Home/Category/Text/Title Blue`, `Input/Text/Value Blue` |
| `navy600` | `#13338B` | `Home/Header/Background/Notification BG` |
| `teal600` | `#00AEA9` | `Secondary/Green_600 - Base`, `Icon/Success`, `Home/Header/Border/Green Border`, price text |
| `teal200` | `#C8E6ED` | Delivery-info strip background (Home) |
| `green200` | `#CCEFEE` | `Secondary/Green_200` — subtitle on the teal mosque banner (Home `4647:134415`) |
| `teal700A60` | `#99028884` (#028884 @ 60%) | Veil over the Subscribe & Save photo (`4128:106501`) |
| `teal50` | `#EEFAF9` | Product card border |
| `teal600_a5` | `#0D00AEA9` (teal600 @ 5%) | Card shadow, size-chip background |
| `mist100` | `#E8F1F5` | Page background gradient end |
| `mist50` | `#F3F7FA` | Page background gradient start / bottom fade |
| `white` | `#FFFFFF` | `Button/Primary/Text`, `Icon/Inverse`, `Input/Background/Default`, card backgrounds |
| `black` | `#000000` | `Card/Text/Title`, `Input/Text/Value`, `Icon/Primary`, `Label Color/Light/Primary` |
| `slate700` | `#3F4A56` | `Card/Text/Subtitle`, `Home/Category/Text/Title Gray` |
| `gray600` | `#74787B` | `Icon/Secondary`, inactive bottom-nav label |
| `gray500` | `#818181` | Pack-size caption on product card ("24 Bottles") |
| `gray400` | `#A7A8A9` | `Input/Text/Placeholder`, `Button/Primary/Background/Disabled`, strikethrough price |
| `red700` | `#B70022` | `Icon/Error` |
| `blue500` | `#3E6AE1` | Splash top tint (29% → 0) — language-selection export `3874:71055` |
| `blue50` | `#EAF4FF` | Selected language option background — same export |
| `gray300` | `#C4C4C4` | Unselected language option border — same export |
| `warning700` | `#B37B16` | `Icon/Warning` |
| `info500` | `#2E90FA` | `Icon/Info` |
| `amber400` | `#FFB020` | Amber status icons — notifications `3876:75508`, How to Earn `4592:117060` |
| `teal800` | `#007A76` | Deep-teal rule icons and example text — How to Earn `4592:117060` |
| `olive400` | `#B4B65D` | Glow at the foot of the product card's cart button `5167:101891` |
| `gray200` | `#E2E2E2` | "Worth" on the navy points card `4804:69645` |
| `white10` | `#FFFFFF` @ 10% | Expiry strip on the navy points card |
| `green600` | `#009A43` | Status green ("Order Confirmed", "PAID") — `5482:141781` |
| `blue200` | `#CFE1FF` | Soft rule in the order summary card |
| `secondaryStrokeDisabled` | `#DFEFFF` | Disabled secondary button stroke — order filter sheet `5908:36895` |
| `navy700A5` | `#04247C` @ 5% | Outline of option rows and schedule cards |
| `teal600A8` | `#00AEA9` @ 8% | Fill of the "2 Deliveries a week" chips |

### 2.2 Semantic tokens (`AppColorScheme` ThemeExtension) — what features use

| Semantic token | Maps to | Use for |
|---|---|---|
| `brand` | `navy700` | Primary buttons, brand icons, headers, active nav, links |
| `brandElevated` | `navy600` | Icon buttons sitting on the navy header |
| `onBrand` | `white` | Text/icons on `brand` |
| `accent` | `teal600` | Prices, success, selected states, header bottom border |
| `accentSubtle` | `teal200` | Info strips (delivery / min-order banner) |
| `accentTint` | `teal600_a5` | Size chip, soft highlights |
| `onAccentMuted` | `green200` | Secondary text on an `accent` surface (mosque banner) |
| `promoVeil` | `teal700A60` | Tint over a promo photo so white text reads on it |
| `background` | `mist50` | Scaffold background (solid fallback) |
| `surface` | `white` | Cards, inputs, sheets, bottom nav |
| `cardBorder` | `teal50` | Product/info card outline |
| `selectedSurface` | `blue50` | Selected option fill (language selection) |
| `outline` | `gray300` | Unselected option border |
| `textPrimary` | `black` | Titles, product names, input values |
| `textSecondary` | `slate700` | Subtitles, category eyebrow |
| `textTertiary` | `gray500` | Small captions |
| `textMuted` | `gray400` | Placeholders, old (struck) prices |
| `iconPrimary` / `iconSecondary` | `black` / `gray600` | Icons |
| `disabled` | `gray400` | Disabled button background |
| `success` | `teal600` | Success icon, delivered status |
| `error` | `red700` | Error icon, error text, destructive actions |
| `warning` | `warning700` | Warning icon and text (paused, yet to deliver) |
| `info` | `info500` | Info icon tint (order confirmed, redeeming points) |
| `attention` | `amber400` | Amber status icon (order on the way, points validity) |
| `accentStrong` | `teal800` | Deep-teal icons on a pale teal card (How to Earn rules) |
| `onBrandMuted` / `onBrandVeil` | `gray200` / `white10` | Secondary text and the soft strip on a `brand` surface (points card) |
| `positive` | `green600` | "Order Confirmed", "Order Scheduled", "PAID" |
| `hairline` / `accentWash` | `navy700A5` / `teal600A8` | Option-row outline; summary-chip fill |

> Note the design uses **teal as "success"** (`Icon/Success = #00AEA9`) — there is no separate green.

## 3. Typography — **Cocon® Offc**

All UI text uses **Cocon Offc** in three weights: **Light (300)**, **Regular (400)**, **Bold (700)**.
(`SF Pro Text` in the file is only the iOS status-bar mock — do not use it.)
Figma has **no italic** styles: weights are Light / Regular / Bold only — never use `FontStyle.italic`.

- Cocon Offc is a **commercial font** — the client must confirm the licence covers app embedding. `TODO(team)`.
- **Bundled:** `assets/fonts/Cocon/Cocon-Regular.otf` as family `Cocon` (`AppTypography.fontFamily`). **Light and Bold files are still missing:** until they are added to `pubspec.yaml` (weights 300 / 700), Light text renders in Regular and Bold is synthesised.
- Cocon's own line height is **1.216 × size**, which is what Figma's "auto" line height uses; styles with a `normal` line height below leave `height` null so the two match.
- **Arabic:** Cocon has no Arabic glyphs. Tajawal (`assets/fonts/Tajawal/`) is the stand-in via `fontFamilyFallback`. `TODO(figma)`: confirm the Arabic font.
- **Weights in Figma:** body copy is mostly **Light** (14 / 16), titles, buttons and prices are **Regular**, and **Bold** is only for small prices (`QAR 96.00`, 12/16), discount ribbons and the "OUR BESTSELLER" badge. Do not reach for Bold to make a title stand out.

### 3.1 Text styles (observed on Home)

| Token | Size | Weight | Line height | Letter spacing | Case | Used for |
|---|---|---|---|---|---|---|
| `titleXl` | 28 | Regular | normal | 0 | — | Large screen title |
| `displayPoints` | 32 | Regular | normal | 0 | — | Points balance figure |
| `displayTitle` | 24 | Regular | normal | 0 | — | "Rayyan Water World", "Enter Mobile Number", "My Favourite" |
| `heroTitle` | 20 | Regular | normal | 0 | Capitalize | "Refreshment in Every Drop", "Guest User", Profile title |
| `headingLight` | 20 | Light | 28 | 0 | — | "Welcome to" (Figma `Headings/Light/H5`) |
| `pageTitle` | 16 | Regular | normal | 0 | — | Screen and sheet titles, "Bill Summary", "Hold On!" |
| `sectionTitle` | 16 | Regular | 16 | 0 | — | "Easy Reorder", "What's New", header location |
| `sectionTitleOnBrand` | 16 | Regular | normal | 0.5 | Capitalize | "Best Sellers" on navy band |
| `subtitleLight` | 16 | Light | normal | 0 | — | Screen subtitles, "Delivery Day & Time" |
| `buttonLarge` | 16 | Regular | 24 | 0 | — | Continue / Verify / Confirm Location |
| `priceMedium` | 16 | Regular | 16 | 0 | — | Cart and checkout totals |
| `cardTitle` | 14 | Regular | 20 | 0 | — | Row and card titles, "Add New Card", "Copy Code" |
| `bodyLight` | 14 | Light | 20 | 0 | — | Body copy, hints, "Expires", "Add special instructions" |
| `priceLarge` | 14 | Regular | 16 | 0 | — | Highlighted price in Easy Reorder |
| `body` | 13 | Regular | 16 | 0 | — | Order item summary |
| `label` | 12 | Regular | 16 | 0 | — | Product name, bottom-nav label, "T&C" |
| `priceSmall` | 12 | Bold | 16 | 0 | — | Product card price ("QAR 96.00") |
| `captionLight` | 12 | Light | 16 | 0 | — | "Prices are inclusive of Taxes", delivery strip |
| `eyebrow` | 12 | Regular | normal | 2 | UPPERCASE | "PURE BY NATURE", "ORDER NO." |
| `sizeValue` | 13 | Regular | normal | 0 | UPPERCASE | "250" on size chip |
| `micro` | 10 | Light / Regular | normal / 12 | 0 | — | "24 Bottles", "ML" |
| `badge` | 8 | Bold | normal | 0 | UPPERCASE | "OUR BESTSELLER" |

Rules:
- `height = lineHeight / fontSize` (e.g. 12/16 → `height: 1.333`). "normal" → leave `height` null.
- Map to Material `TextTheme` where it fits (`titleLarge`←heroTitle, `titleMedium`←sectionTitle, `bodyMedium`←bodyLight, `labelMedium`←label …) and expose the rest via an `AppTextStyles` ThemeExtension (`context.textStyles.priceSmall`).
- Strikethrough price = `captionLight` + `TextDecoration.lineThrough` + `textMuted` — implement once in a shared `PriceText` widget.
- Other screens (checkout, profile, OTP) may use sizes not listed — add them here only after checking Figma. `TODO(figma)`.

## 4. Spacing, radius, shadows, gradients

```dart
abstract final class AppSpacing {
  // Figma spacing variables: "2" = 8, "3" = 12, "4" = 16, "7" = 32, "Spacing/SM" = 8
  static const double s1 = 4;    // inferred step — confirm
  static const double s2 = 8;    // Figma "2" / Spacing/SM
  static const double s3 = 12;   // Figma "3"
  static const double s4 = 16;   // Figma "4"
  static const double s6 = 24;   // observed gap between section title and content
  static const double s7 = 32;   // Figma "7"
  static const double s10 = 40;  // observed gap between Home sections

  static const double screenGutter = 20;   // 20pt side margins (362pt content on 402pt frame)
  static const double tileInline = 14;     // Profile / Policies rows and the points card
  static const double cardGap = 16;        // gap between grid cards
}

abstract final class AppRadius {
  static const double xs = 4;      // favourite icon button
  static const double l = 8;       // Figma "Radius/l" — buttons
  static const double card = 12;   // cards, inputs, chips, header icon button, banners (TODO(figma): variable name)
  static const double sheet = 16;   // language-selection panel top corners
  static const double xl5 = 28;    // Figma "Radius/5xl" — large pills / sheets
  static const double pill = 100;
}
```

| Shadow token | Value | Used on |
|---|---|---|
| `AppShadows.card` | `BoxShadow(offset: Offset(0, 6), blurRadius: 16, color: teal600 @ 5%)` | Product card, carousel indicator |
| `AppShadows.categoryCard` | `BoxShadow(offset: Offset(0, 6), blurRadius: 23, color: teal600 @ 5%)` | Home category cards |

| Gradient token | Value | Used on |
|---|---|---|
| `AppGradients.pageBackground` | top→bottom: `mist100 @ 0%` → `mist100 @ 30%` (65.7%) → `mist100` (92.4%) over a 30%-opacity background image | Home body |
| `AppGradients.dividerBrand` | left→right: `navy700 @ 0%` → `navy700` | Footer "From the heart of Qatar" lines |
| `AppGradients.dividerBrandSoft` | start→end: `white @ 0%` → `navy700 @ 50%` | "Choose language" side rules |
| `AppGradients.splashTopTint` | top→bottom: `blue500 @ 29%` → `white @ 0%` over the first 197.5pt | Splash / language photo |
| `AppGradients.splashBottomShade` | top→bottom: `black @ 0%` at 263pt → `black` at 605pt | Splash / language photo |
| `AppGradients.dividerOnBrand` | left→right: `white @ 0%` → `white` | Section title rule on navy band |
| `AppGradients.cardActionRing` | top→bottom: `white` → `white` (59.6%) → `olive400` | Ring round the product card's cart button |
| `AppGradients.cardRule` | `blue200` 0% → 60% → 0% | 1px rules in the order summary card and schedule rows |
| `AppGradients.noticeWash` | top→bottom: `amber400 @ 15%` → `white @ 0%` | "Payment failed…" and "Pay before…" notices |
| `AppGradients.pointsCardBorder` | top-end→bottom-start: `teal600` → `white` | 1px border of the navy points card |

## 5. Component specs (from Figma)

| Component | Spec |
|---|---|
| **Primary button** | bg `brand`, text `onBrand` `label` style, padding 12 h / 8 v, radius `l` (8); disabled bg `disabled` |
| **Input field** | bg `surface`, radius 12, padding 12 h / 14 v, 8 gap icon→text, placeholder `bodyLight` + `textMuted`, value `textPrimary` |
| **Product card** | 173 × 270, bg `surface`, 1px `cardBorder`, radius 12, `AppShadows.card`; name `label`, price `priceSmall` + `accent` |
| **Category card** | bg `surface`, radius 12, `AppShadows.categoryCard`, title `cardTitle` + `brand` |
| **Home header** | bg `brand`, 3px bottom border `accent`; location `sectionTitle` white, address `bodyLight` white; bell in 42×42 `brandElevated` radius-12 box |
| **Bottom nav** | 5 slots: Home · Products · (center Cart FAB, shopping-bag) · Favourite · Profile; labels `label`; active `brand`, inactive `gray600`; 22pt icons |
| **Info strip** | bg `accentSubtle`, text `captionLight` + `accent`, 10 v padding, items separated by "•" |
| **Carousel dots** | white pill container, radius 12, `AppShadows.card`, 6 gap |

Configure Material defaults once in `app_theme.dart` (`elevatedButtonTheme`, `inputDecorationTheme`,
`cardTheme`, `bottomSheetTheme`, `dialogTheme`, `checkboxTheme`, `radioTheme`, `navigationBarTheme`) so
feature widgets need no overrides.

## 6. Icons & imagery

- Icons are **SVGs exported from Figma** (Vuesax/Iconsax outline set plus `COCO/Line/*`) under `assets/icons/figma/ic_*.svg`. They are black single-colour glyphs; there is no `iconsax_flutter`, and feature code uses no Material `Icons` (the only one kept is the checkbox tick in `AppCheckOption`, which has no SVG). `pubspec.yaml` must list `assets/icons/figma/` (directory entries are not recursive).
- Every path is a `String` constant on `AppIcons` (`core/assets/app_icons.dart`). Draw them with `AppIcon` (`core/widgets/media/app_icon.dart`): `AppIcon(AppIcons.search, size: AppIconSizes.search, color: colors.iconPrimary)`. Widgets that take an icon take the asset `String`.
- Active bottom-nav icons (`homeActive`, `productsActive`, `favouriteActive`, `profileActive`) are Figma's solid exports; `homeActive` is multicolour (`tint: false`). `favouriteFilled` is a solid heart so the toggle state stays visible.
- Directional arrows (`back`, `chevronStart`, `chevronEnd`) point in LTR; mirror them in RTL with `matchTextDirection: true` (`AppTopBar` does).
- Multicolour marks (`google`, `apple`, `heartCard`, `pointsCoin`) must not be tinted: `AppIcon(AppIcons.apple, tint: false)`.
- `AppIcon` always draws at its `size`: inside a larger fixed box (a 48pt button, a 40pt tile badge) it is centred, never stretched. Size the box with the container, the glyph with `size`.
- `AppIcon` tints with `ColorFilter.mode(color, BlendMode.srcIn)`; pass a theme token (or inherit the `IconTheme` colour) — never bake colors into call sites.
- Icon sizes (`AppIconSizes`): 14 (`small`, recurring mark), 16 (`inline`), 18 (`search`, sheet rows), 20 (`header`, `back`, Profile rows, status tiles), 22 (`nav`), 24 (`button`, `tab`), 28 (`cartFab`), 32 (`badge`). Take the size from the Figma instance, not the default.
- Raster assets (logo, product shots, banners) go in `assets/images/` referenced via `AppImages`. Product and banner images from the API are loaded with `cached_network_image`.

## 7. Accessing the theme

```dart
extension ThemeContextX on BuildContext {
  AppColorScheme get colors => Theme.of(this).extension<AppColorScheme>()!;
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
  TextTheme get text => Theme.of(this).textTheme;
}

Text(product.name, style: context.textStyles.label.copyWith(color: context.colors.textPrimary));
Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenGutter), child: …);
```

## 8. Theming guardrails ✅ / ❌

| ❌ Never | ✅ Instead |
|---|---|
| `Color(0xFF04247C)` / `Colors.blue` in feature code | `context.colors.brand` |
| `TextStyle(fontSize: 12, fontWeight: FontWeight.w700)` | `context.textStyles.priceSmall` |
| `fontFamily: 'CoconOffc'` at call sites | Set once in `ThemeData.fontFamily` |
| `EdgeInsets.all(20)` / magic numbers | `AppSpacing.screenGutter` |
| `BorderRadius.circular(12)` | `BorderRadius.circular(AppRadius.card)` |
| `EdgeInsets.only(left: …)`, `Alignment.centerLeft` | `EdgeInsetsDirectional`, `AlignmentDirectional` (Arabic RTL — see `12_LOCALIZATION_AND_RTL.md`) |
| `teal.withOpacity(.05)` inline | `context.colors.accentTint` |
| Styling a button per call site | Shared `AppButton` with `variant` |
| Adding a token that isn't in Figma | Ask / leave `TODO(figma)` |
| Building a dark palette | Light only until dark designs exist |

Enforcement:
- `grep -rnE "Color\(0x|Colors\.[a-z]|fontSize:|fontFamily:" lib/features` must return nothing.
- Never disable text scaling globally; test key screens at 1.3× text scale.
- Tap targets ≥ 48×48 (wrap 20–28pt icons in 48pt hit areas). Check contrast: `gray400` on white is below 4.5:1 — use it only for placeholders and struck prices, never for essential text.

## 9. Changing the theme

1. Update the value in `lib/core/theme/` only.
2. Update the tables in this file in the same change (keep the Figma variable column accurate).
3. Re-run golden tests for shared widgets and update goldens intentionally.
