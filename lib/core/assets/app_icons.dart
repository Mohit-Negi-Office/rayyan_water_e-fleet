/// Every icon the app uses: SVGs exported from Figma under
/// `assets/icons/figma/`, drawn with `AppIcon`.
///
/// The exports are single-style (outline) black glyphs, so "active" and
/// "filled" variants share the asset and differ by colour only. The one
/// exception is `favouriteFilled`, a solid heart (outer outline of
/// `ic_favourite`) so the toggle state stays visible.
abstract final class AppIcons {
  // Navigation and tabs.
  static const String home = 'assets/icons/figma/ic_home.svg';

  /// Filled navy home with a white door (Figma active tab): draw with
  /// `tint: false`.
  static const String homeActive = 'assets/icons/figma/ic_home_active.svg';
  static const String products = 'assets/icons/figma/ic_products.svg';
  static const String productsActive =
      'assets/icons/figma/ic_products_active.svg';
  static const String cart = 'assets/icons/figma/ic_cart_bag.svg';
  static const String cartActive = 'assets/icons/figma/ic_cart_bag.svg';
  static const String favourite = 'assets/icons/figma/ic_favourite.svg';

  /// Solid heart on the active Favourite tab.
  static const String favouriteActive =
      'assets/icons/figma/ic_favourite_active.svg';
  static const String favouriteFilled =
      'assets/icons/figma/ic_favourite_filled.svg';
  static const String profile = 'assets/icons/figma/ic_profile.svg';
  static const String profileActive =
      'assets/icons/figma/ic_profile_active.svg';
  static const String notification = 'assets/icons/figma/ic_notification.svg';
  static const String search = 'assets/icons/figma/ic_search.svg';

  /// COCO line search (Products header button).
  static const String searchLine = 'assets/icons/figma/ic_search_coco.svg';

  /// COCO line arrow (20, 1.5 stroke); mirror it in RTL with
  /// `matchTextDirection`.
  static const String back = 'assets/icons/figma/ic_back.svg';
  static const String language = 'assets/icons/figma/ic_global.svg';
  static const String offline = 'assets/icons/figma/ic_wifi_square.svg';

  // Status and feedback.
  static const String error = 'assets/icons/figma/ic_danger.svg';
  static const String failed = 'assets/icons/figma/ic_danger.svg';
  static const String warning = 'assets/icons/figma/ic_warning.svg';
  static const String exclamation = 'assets/icons/figma/ic_warning.svg';
  static const String info = 'assets/icons/figma/ic_info_circle.svg';
  static const String alertFilled = 'assets/icons/figma/ic_info_circle.svg';
  static const String success = 'assets/icons/figma/ic_tick_circle.svg';
  static const String verified = 'assets/icons/figma/ic_tick_circle.svg';
  static const String doneFilled = 'assets/icons/figma/ic_tick_circle.svg';
  static const String check = 'assets/icons/figma/ic_tick_circle.svg';
  static const String checkboxOn = 'assets/icons/figma/ic_tick_square.svg';
  static const String verifiedBadge = 'assets/icons/figma/ic_verify.svg';
  static const String empty = 'assets/icons/figma/ic_document.svg';
  static const String notFound = 'assets/icons/figma/ic_search_status.svg';
  static const String outsideArea = 'assets/icons/figma/ic_location_cross.svg';
  static const String retry = 'assets/icons/figma/ic_refresh.svg';

  // Location and addresses.
  static const String location = 'assets/icons/figma/ic_location.svg';
  static const String mapPin = 'assets/icons/figma/ic_location.svg';
  static const String currentLocation = 'assets/icons/figma/ic_gps.svg';
  static const String addAddress = 'assets/icons/figma/ic_add_square.svg';
  static const String map = 'assets/icons/figma/ic_map.svg';
  static const String suggestion = 'assets/icons/figma/ic_direct_right.svg';
  static const String addressHome = 'assets/icons/figma/ic_home_2.svg';
  static const String addressWork = 'assets/icons/figma/ic_building.svg';
  static const String addressFamily = 'assets/icons/figma/ic_profile_2user.svg';
  static const String addressOther = 'assets/icons/figma/ic_location.svg';

  // Arrows. Directional ones need `matchTextDirection` where RTL matters.
  static const String chevronDown = 'assets/icons/figma/ic_arrow_down.svg';
  static const String arrowDown = 'assets/icons/figma/ic_arrow_down.svg';
  static const String chevronUp = 'assets/icons/figma/ic_arrow_up.svg';
  static const String backToTop = 'assets/icons/figma/ic_arrow_up.svg';
  static const String arrowUp = 'assets/icons/figma/ic_arrow_up.svg';
  static const String chevronStart = 'assets/icons/figma/ic_arrow_left.svg';
  static const String chevronEnd = 'assets/icons/figma/ic_arrow_right.svg';
  static const String forward = 'assets/icons/figma/ic_arrow_right.svg';

  // Actions.
  /// Custom bag glyph of the product card's cart button.
  static const String addToCart = 'assets/icons/figma/ic_card_bag.svg';
  static const String shoppingCart = 'assets/icons/figma/ic_shopping_cart.svg';
  static const String notifyMe = 'assets/icons/figma/ic_reminder.svg';
  static const String notifyMeSet = 'assets/icons/figma/ic_reminder_check.svg';
  static const String close = 'assets/icons/figma/ic_close.svg';
  static const String moreVertical = 'assets/icons/figma/ic_more.svg';
  static const String clearInput = 'assets/icons/figma/ic_close_circle.svg';
  static const String removeCircle = 'assets/icons/figma/ic_close_circle.svg';
  static const String closeFilled = 'assets/icons/figma/ic_close_circle.svg';
  static const String plus = 'assets/icons/figma/ic_add.svg';
  static const String plusCoco = 'assets/icons/figma/ic_plus_coco.svg';
  static const String minus = 'assets/icons/figma/ic_minus.svg';
  static const String minusCoco = 'assets/icons/figma/ic_minus_coco.svg';
  static const String delete = 'assets/icons/figma/ic_trash.svg';
  static const String edit = 'assets/icons/figma/ic_edit_2.svg';
  static const String pencil = 'assets/icons/figma/ic_edit.svg';
  static const String filter = 'assets/icons/figma/ic_setting_4.svg';
  static const String camera = 'assets/icons/figma/ic_camera.svg';
  static const String image = 'assets/icons/figma/ic_gallery.svg';
  static const String logout = 'assets/icons/figma/ic_logout.svg';
  static const String call = 'assets/icons/figma/ic_call.svg';

  /// Recurring-order mark (14, 1px stroke).
  static const String repeat = 'assets/icons/figma/ic_refresh_2.svg';

  // Commerce and orders.
  static const String star = 'assets/icons/figma/ic_star.svg';
  static const String drop = 'assets/icons/figma/ic_drop.svg';
  static const String orderConfirmed = 'assets/icons/figma/ic_box.svg';
  static const String orderOnTheWay = 'assets/icons/figma/ic_box_time.svg';
  static const String orderDelivered = 'assets/icons/figma/ic_box_tick.svg';
  static const String orders = 'assets/icons/figma/ic_box.svg';
  static const String refund = 'assets/icons/figma/ic_box_remove.svg';
  static const String offer = 'assets/icons/figma/ic_ticket_discount.svg';
  static const String coupon = 'assets/icons/figma/ic_discount_shape.svg';
  static const String deliver = 'assets/icons/figma/ic_truck.svg';
  static const String truck = 'assets/icons/figma/ic_truck.svg';

  /// Outline truck on the Home "Upcoming Repeat Delivery" card.
  static const String truckOutline = 'assets/icons/figma/ic_truck.svg';
  static const String repeatOrder = 'assets/icons/figma/ic_schedule.svg';
  static const String calendar = 'assets/icons/figma/ic_calendar.svg';
  static const String clock = 'assets/icons/figma/ic_clock.svg';
  static const String note = 'assets/icons/figma/ic_special_instruction.svg';

  // Payments.
  static const String card = 'assets/icons/figma/ic_card.svg';
  static const String qpay = 'assets/icons/figma/ic_qpay.svg';
  static const String cash = 'assets/icons/figma/ic_money.svg';
  static const String moneys = 'assets/icons/figma/ic_moneys.svg';

  // Loyalty (How to Earn & Redeem, Figma `4592:117060`).
  static const String earnPoints = 'assets/icons/figma/ic_dollar_circle.svg';
  static const String gift = 'assets/icons/figma/ic_gift.svg';
  static const String minimumPoints =
      'assets/icons/figma/ic_arrow_circle_down.svg';
  static const String maximumPoints =
      'assets/icons/figma/ic_maximize_circle.svg';

  // Profile and support.
  static const String whatsApp = 'assets/icons/figma/ic_whatsapp.svg';
  static const String policies = 'assets/icons/figma/ic_document.svg';
  static const String termsPolicy = 'assets/icons/figma/ic_document_text.svg';
  static const String earn = 'assets/icons/figma/ic_profile.svg';
  static const String aboutUs = 'assets/icons/figma/ic_profile_2user.svg';

  /// Multicolour brand marks: draw with `tint: false`.
  static const String apple = 'assets/icons/figma/ic_apple.svg';
  static const String google = 'assets/icons/figma/ic_google.svg';
  static const String heartCard = 'assets/icons/figma/ic_heart_card.svg';

  /// Teal-and-white coin on the Profile points card (Figma `4804:69650`).
  static const String pointsCoin = 'assets/icons/figma/ic_points_coin.svg';

  // Driver app (Figma "Driver Final Desings" `4671:137914`).
  /// "My Details" row.
  static const String user = 'assets/icons/figma/ic_user.svg';

  /// "Terms & Conditions" row: a page with a folded corner.
  static const String terms = 'assets/icons/figma/ic_document_fold.svg';

  /// "Privacy & Policies" row: a box with two lines.
  static const String privacy = 'assets/icons/figma/ic_document_lines.svg';

  /// Order status marks: new / picked / at drop-off, re-assigned,
  /// delivered, failed.
  static const String orderBox = 'assets/icons/figma/ic_box.svg';
  static const String reassigned = 'assets/icons/figma/ic_refresh_2.svg';

  /// Order History row on Home (Figma `5924:40933`).
  static const String orderHistory = 'assets/icons/figma/ic_refresh_2.svg';
  static const String delivered = 'assets/icons/figma/ic_tick_circle.svg';
  static const String deliveryFailed = 'assets/icons/figma/ic_info_circle.svg';
  static const String cancelled = 'assets/icons/figma/ic_close_circle.svg';

  /// Directions to the delivery location.
  static const String directions = 'assets/icons/figma/ic_direct_right.svg';

  /// Radio of the Fail Delivery reasons, in their own colours: draw with
  /// `tint: false`.
  static const String radioOn = 'assets/icons/figma/ic_radio_on.svg';
  static const String radioOff = 'assets/icons/figma/ic_radio_off.svg';
}

/// Default icon sizes seen in Figma.
abstract final class AppIconSizes {
  /// Banner chevrons and the recurring-order mark.
  static const double small = 14;
  static const double inline = 16;
  static const double search = 18;
  static const double header = 20;
  static const double nav = 22;

  /// Leading/trailing icons of large buttons (Add To Cart, Checkout →).
  static const double button = 24;

  /// Bottom bar tab icons, measured from the bar export.
  static const double tab = 24;
  static const double cartFab = 28;

  /// Glyph inside the large round status badges (cancelled, placed).
  static const double badge = 32;
  static const double state = 48;
  static const double illustration = 96;

  /// COCO back arrow (Figma `781:30255`).
  static const double back = 20;

  /// Social logos and the +974 flag on the login screen, measured.
  static const double brandMark = 20;
}
