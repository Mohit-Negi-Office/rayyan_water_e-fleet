# Widget Catalog (Mobile App)

Single source of truth for shared and feature widgets. **Check this before creating any widget**
(`04_WIDGETS_AND_UI.md` §1) and **update it** whenever you add or extend one.

The "Figma component" column is the component name on the *Components* page (`740:14875`) / instance
name in *Final Designs*; the count shows how often it appears — high counts must be **one** shared widget.

Status: _planned_ until implemented — then remove the italics and fill the path.

## Shared — `lib/core/widgets/`

| Widget | Path | Figma component (uses) | Purpose / variants |
|---|---|---|---|
| AppButton | `buttons/app_button.dart` | Button (449) | variants: primary, outline, text, danger; `size` regular / large (56pt CTA); `isLoading`, `leadingIcon`, `isExpanded` |
| AppIconButton | `buttons/app_icon_button.dart` | Close (61), header bell box, Favourite | 48pt hit area, tooltip, `badgeCount`, `backgroundColor` for the boxed variant |
| AppRadioTile | `selection/app_radio_tile.dart` | Radio (430) | Generic `<T>`: value, groupValue, label, `isCentered`, optional leading. Selected = tinted fill + brand border. Language, payment method, slot, frequency |
| AppCheckOption | `selection/app_check_option.dart` | Check Box (33), Radio | Label with a checkbox or radio (`AppCheckControl`), control leading or trailing. Filters, "Set this address as default" |
| AppChip / AppChipTabs | `selection/app_chip.dart` | Tabs (All, Glass, Sparkling…), Location Type | Pill chip with optional icon; `AppChipTabs<T>` is a horizontal single-choice row. Products, favourites, address type, recent searches |
| AppTextField | `inputs/app_text_field.dart` | Input Field (163) | label (`isRequired` adds "*"), hint, errorText, keyboard and action |
| AppSearchInput | `inputs/app_search_input.dart` | Search bar (editable) | Search box with clear button; product and address search |
| _PhoneNumberField_ | `inputs/phone_number_field.dart` | Input Field + country code | +974 default, LTR forced |
| _OtpInput_ | `inputs/otp_input.dart` | OTP boxes | 4 digits, error state, LTR forced |
| QuantityStepper | `inputs/quantity_stepper.dart` | COCO/Line/Plus, Minus (14) | Two-digit count; `compact` (card) and `wide` (detail bar) |
| AppTopBar | `navigation/app_top_bar.dart` | COCO/Line/Arrow - Left (185) | Title, back (shown when the router can pop), actions; RTL-aware arrow |
| AppBottomNav | `navigation/app_bottom_nav.dart` | Bottom bar + cart FAB | 4 tabs, arched top (`AppNavBarShape`), centre cart lifted above the bar. Shell uses `extendBody` so content scrolls under it |
| AppCartFab | `navigation/app_cart_fab.dart` | Centre cart button | Navy drop with halo; two-digit teal `count` badge ("04", "99+"), `onPressed` |
| AppNavBarShape | `navigation/app_nav_bar_shape.dart` | Bottom bar outline | Arched top edge with a notch for the cart |
| ProductCard | `product/product_card.dart` | Product Card (137) | 173 × 270; image, size chip, name, `PriceText`, favourite. Action: add-to-cart, stepper once in the cart, or out of stock + notify me (**approval pending**, in `product_card_action.dart`). `ProductCard.gridDelegate` for 2-column grids. Use `ShopProductCard` (`lib/app/shop/`) to get it wired to cart and favourites |
| PriceText | `product/price_text.dart` | price + struck price | minor units; original shown struck through only when higher; `isLarge` |
| SizeChip | `product/size_chip.dart` | "Size" group on card | pack count + volume |
| FavouriteToggle | `product/favourite_toggle.dart` | Heart (36) | filled / outline, tooltip |
| OfferBadge | `feedback/offer_badge.dart` | Offer (26) | Teal ribbon with stars; RTL-mirrored notch |
| InfoStrip | `feedback/info_strip.dart` | Home delivery strip | items separated by "•" |
| AppTooltipBubble | `feedback/app_tooltip_bubble.dart` | Tooltip (8) | Always-visible dark hint with arrow ("Move pin to your exact delivery location") |
| BackToTopButton | `feedback/back_to_top_button.dart` | Scroll to top | Floating button on long lists |
| CarouselDots | `media/carousel_dots.dart` | Carousels | active/inactive dots in white pill |
| AppNetworkImage | `media/app_network_image.dart` | Product / banner photos | Cached network image with a placeholder when the URL is null or fails; `assets/` paths (bundled mock images) load from the bundle |
| AppIcon | `media/app_icon.dart` | All Figma icons (`assets/icons/figma/`) | `asset` path from `AppIcons`, `size`, `color` (falls back to `IconTheme`), `matchTextDirection` for RTL arrows, `tint: false` for multicolour marks (Google, Apple); centred, never stretched, inside a larger fixed box |
| AppIllustration | `media/app_illustration.dart` | Empty states, confirm sheets (open box, torn ticket, folded map, bin) | `AppImages` illustration at `emptyState` (192) or `sheet` (120) size |
| showAppBottomSheet / AppSheetFrame | `overlays/app_bottom_sheet.dart` | Filter, Upload an Image, outside-area and remove sheets | Floating grey close button, tinted top; close with `context.pop()` |
| AppChoiceCard | `selection/app_choice_card.dart` | Deliver Until, Pause Type, Payment Type rows | White card, hairline border, radio at the end; light label that turns regular when chosen; optional `icon`, `isProminent` (16 regular title) and `child` shown under the label |
| AppChoiceSheet / AppSheetNote | `overlays/app_choice_sheet.dart` | Deliver Until, Delivery Slot, Cancel Delivery, Select Resume Date sheets | 16pt title, options, optional `footer` and a full-width action; `AppSheetNote` is the red ⓘ line |
| AppActionSheet / AppActionTile | `overlays/app_action_sheet.dart` | Upload an Image, address Edit / Delete; `.menu` for Profile and Policies rows | Optional title over rows with icon and chevron; `isDestructive`; `AppActionTile.menu` is borderless with 20pt icons and an 8pt gap |
| AppConfirmSheet | `overlays/app_confirm_sheet.dart` | Remove favourite, outside delivery area, delete address | Illustration, title, message, one action; `AppConfirmSheet.show` resolves to true when tapped |
| AppLoadingView | `states/app_loading_view.dart` | — | full / `.compact` |
| AppEmptyView | `states/app_empty_view.dart` | empty cart (30), No Favourites, No Location, No Saved cards, Illustrations (11) | illustration, title, message, action |
| AppErrorView | `states/app_error_view.dart` | — | failure, onRetry, `.compact`; Retry hidden for non-retryable failures |
| AppStateLayout | `states/app_state_layout.dart` | — | Shared layout behind the empty and error views |
| AppInlineBanner | `feedback/app_inline_banner.dart` | Inline errors ("Incorrect OTP", failed save) | `.error`, `.info`, `.success` |
| SectionHeader | `layout/section_header.dart` | "Easy Reorder", "What's New", "Best Sellers" | title; `.onBrand` variant with gradient rule |
| LabeledDivider | `layout/labeled_divider.dart` | "Choose language", footer origin line | label between two faded rules |
| RayyanLogo | `brand/rayyan_logo.dart` | Logo | Bilingual logo, `scale` |
| AppSearchField | `inputs/app_search_field.dart` | Home search bar, map search bar | tap-to-open search entry; optional bold `highlight` |
| BrandFooter | `brand/brand_footer.dart` | Footer | Logo, tagline, "From The Heart Of Qatar" (Home, product listing) |
| TintedScaffold | `layout/tinted_scaffold.dart` | Page background | Scaffold over the soft blue page gradient |
| WaveTopClipper | `layout/wave_top_clipper.dart` | Wavy top edge | Product detail sheet, My Favourite; mirrored in RTL |
| _SummaryRow_ / _BillSummary_ | `layout/bill_summary.dart` | Order Summary / Bill Summary | Item total, discount, delivery fee, VAT, total — shared by cart & checkout |
| _SavedCardTile_ | `layout/saved_card_tile.dart` | Visa •••• 786 | brand, masked number, expiry |

Icons: `AppIcons` in `core/assets/app_icons.dart` holds Figma-exported SVG paths (`assets/icons/figma/`), drawn with `AppIcon`; widgets take the asset `String`, not `IconData`. No iconsax — see `01_THEME.md` §6. Do not create a widget per icon.

## Feature-local — `lib/features/<feature>/presentation/widgets/`

| Feature | Widget | Path | Purpose |
|---|---|---|---|
| home | HomeFeedView | `home/presentation/widgets/home_feed_view.dart` | Sliver list of every Home section; hides optional ones that are empty |
| home | HomeHeader | `home/presentation/widgets/home_header.dart` | Navy header: location, bell with badge, search, banner carousel |
| home | LocationSelector | `home/presentation/widgets/location_selector.dart` | Address or "Select Location" |
| home | PromoBannerCarousel | `home/presentation/widgets/promo_banner_carousel.dart` | Paged banners + dots |
| home | CategoryHeading / CategoryMosaic / CategoryCard | `home/presentation/widgets/category_*.dart` | "Refreshment In Every Drop" mosaic (first 6) + grid for the rest |
| home | EasyReorderCard | `home/presentation/widgets/easy_reorder_card.dart` | Last order + Reorder |
| home | HomeOrderSlivers / HomeSectionTitle | `home/presentation/widgets/home_order_slivers.dart` | Upcoming Repeat Delivery + Easy Reorder sections; section title sliver |
| home | UpcomingDeliveryCard | `home/presentation/widgets/upcoming_delivery_card.dart` | "2/4 Order Picked Up", slot, COD chip, total + Pay Now (`4647:121240`) |
| home | MosqueDeliveryBanner | `home/presentation/widgets/mosque_delivery_banner.dart` | Teal "Nearby mosque delivery" banner (`4647:134415`) |
| app/shop | ShopProductCard / ProductCarousel | `lib/app/shop/` | `ProductCard` connected to cart, favourites and stock alerts; horizontal product row with dots |
| home | BestSellersBand | `home/presentation/widgets/best_sellers_band.dart` | Navy wave band with a product row |
| checkout | _DeliverySlotPicker_ | — | Today / Tomorrow / calendar + slots |
| checkout | ScheduleDeliveryPage + ScheduleDayPicker, ScheduleDaysCard, SchedulePeriodCard, ScheduleNoteChip, ScheduleSummaryBar | `5594:143415` | Weekly chips / monthly grid, a slot per day, Deliver Until, summary and Confirm |
| checkout | DeliverUntilSheet, SlotPickSheet | `5594:147375`, `5594:148928` | Built on `AppChoiceSheet` |
| checkout | PaymentTypePage, PaymentTypeCard | `5594:144284`, `5594:144342` | Pay as you go / Pay upfront, and its checkout card with Edit |
| app/orders | OrderSummaryCard, OrderSummaryRow | `5482:141781` | Status, number, Placed On, Order Type and a footer row (Payment Status or the schedule) |
| orders | PaymentStatusTag | `5446:139118` | PAID / PENDING / COD over "Payment Status" |
| orders | OrderNoticeCard | `4589:100466` | Amber-washed ⓘ notice; `isSmall` inside a delivery card |
| orders | UpfrontCard | `5594:149368` | "Pay Upfront" with the count × price total |
| orders | CancelDeliverySheet, ResumeSheet, PauseRangeSheet, RangePicker | `5594:153839`, `5594:150571`, `5594:150366` | Cancel all or chosen dates; resume and pause date ranges |
| rewards | _PointsCard_ | — | Points, value, expiry |
| onboarding | SplashBackground | `onboarding/presentation/widgets/splash_background.dart` | Splash photo with tint and shade |
| onboarding | SplashVideo | `onboarding/presentation/widgets/splash_video.dart` | Full-bleed splash intro video; reports when it ends |
| onboarding | WelcomeHeading | `onboarding/presentation/widgets/welcome_heading.dart` | Welcome copy + short rule |
| onboarding | ChooseLanguageDivider | `onboarding/presentation/widgets/choose_language_divider.dart` | Label with faded side rules |
| onboarding | LanguageSelectionPanel | `onboarding/presentation/widgets/language_selection_panel.dart` | English / Arabic choice + Continue |
| notifications | NotificationsList / NotificationTile | `notifications/presentation/widgets/` | Day-grouped list; swipe to delete, unread dot |
| catalog | ProductsToolbar / ProductsScrollView | `catalog/presentation/widgets/` | Category chips, "N Products found", filter button with count badge, grid with back to top and end-of-list footer |
| catalog | MosqueDeliveryCard | `catalog/presentation/widgets/mosque_delivery_card.dart` | Mosque being shopped for, with edit (`4906:81448`) |
| catalog | SubscribeSaveTile | `catalog/presentation/widgets/subscribe_save_tile.dart` | Subscribe & Save promo in the product grid (`4128:106498`) |
| catalog | FilterSheet / FilterSections | `catalog/presentation/widgets/` | Sizes, category and brand groups with Reset / Apply |
| catalog | SearchLandingView / SearchResultsGrid / SearchNotFoundView | `catalog/presentation/widgets/` | Recent searches and sections, results, not found |
| catalog | ProductDetailContent / VariantSelector / ProductDetailBar / ViewCartPill | `catalog/presentation/widgets/` | Detail sheet: sizes, add-ons, description, bottom bar (out of stock is **approval pending**) |
| addresses | AddressListTile / SavedAddressTile | `addresses/presentation/widgets/` | Saved address and suggestion rows; Selected badge, Edit / Delete menu |
| addresses | AddressesLanding / PlaceSearchResultsView | `addresses/presentation/widgets/` | Quick actions with saved list or guest / empty state; suggestions and not found |
| addresses | MapPlaceholder | `addresses/presentation/widgets/map_placeholder.dart` | Pannable street grid until the maps SDK is added |
| addresses | MapDeliveryCard / MapLoginCard / MapCurrentLocationButton / MapPanelCard | `addresses/presentation/widgets/map_bottom_panel.dart` | "Order will be delivered here" + Confirm, guest login strip, the shared floating card |
| addresses | MosqueMapLayer / MosqueCards | `addresses/presentation/widgets/mosque_*.dart` | Mosque markers over the map; swipeable mosque cards (`4906:80755`) |
| addresses | AddressPhotoSlots / AddressFormFields / AddressPlaceCard | `addresses/presentation/widgets/` | Complete / Edit Your Address form parts |
| favourites | FavouritesHeader / FavouritesGrid | `favourites/presentation/widgets/` | Navy header; category tabs over the favourites grid |
