// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Rayyan E-Fleet';

  @override
  String get commonRetry => 'Retry';

  @override
  String get commonContinue => 'Continue';

  @override
  String get commonBack => 'Back';

  @override
  String get commonGoHome => 'Go To Home';

  @override
  String get onboardingWelcomeTo => 'Welcome to';

  @override
  String get onboardingWelcomeTitle => 'Rayyan Water World';

  @override
  String get onboardingTagline => '~ Your Daily Drop of Nature ~';

  @override
  String get onboardingChooseLanguage => 'Choose language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageArabic => 'Arabic';

  @override
  String get navHome => 'Home';

  @override
  String get navProducts => 'Products';

  @override
  String get navCart => 'Cart';

  @override
  String get navFavourite => 'Favourite';

  @override
  String get navProfile => 'Profile';

  @override
  String get cartTitle => 'My Cart';

  @override
  String cartTitleCount(int count) {
    return 'My Cart ($count)';
  }

  @override
  String get cartEmptyTitle => 'Your cart is currently empty';

  @override
  String get cartEmptyMessage =>
      'Looks like you haven’t added any product to your cart yet.';

  @override
  String get cartViewProducts => 'View Products';

  @override
  String get cartAddItem => 'Add Item';

  @override
  String get cartCouponCode => 'Coupon Code';

  @override
  String get cartApplyCoupon => 'Apply Coupon';

  @override
  String get cartViewAllCoupons => 'View All Coupons';

  @override
  String get cartRemoveCoupon => 'Remove coupon';

  @override
  String get cartOrderSummary => 'Order Summary';

  @override
  String get cartItemTotal => 'Item Total';

  @override
  String get cartDiscount => 'Discount';

  @override
  String cartDiscountValue(String amount) {
    return '- $amount';
  }

  @override
  String get cartDeliveryFee => 'Delivery fee';

  @override
  String get cartVat => 'VAT';

  @override
  String get cartTotal => 'Total (Tax Included)';

  @override
  String get cartCheckout => 'Checkout';

  @override
  String get cartLoginToContinue => 'Login to Continue';

  @override
  String cartMinimumTitle(String amount) {
    return 'Shop $amount More to unlock';
  }

  @override
  String get cartMinimumMessage => 'Add more to reach minimum order';

  @override
  String cartPriceChanged(String price) {
    return 'Product price changed to $price';
  }

  @override
  String get cartUnavailable => 'This product is no longer available';

  @override
  String get cartRemove => 'Remove';

  @override
  String get cartPriceChangedQuestion => 'Do you still want to continue?';

  @override
  String get cartRemoveItem => 'Remove Item';

  @override
  String get couponsTitle => 'Coupon Code';

  @override
  String get couponsInputHint => 'Enter Coupon Code';

  @override
  String get couponsApplyList => 'Apply Coupons';

  @override
  String get couponsNotApplicable => 'This Coupon is not applicable';

  @override
  String get couponsTerms => 'T&C';

  @override
  String get couponsRemove => 'Remove';

  @override
  String get couponsClearCode => 'Clear code';

  @override
  String get couponsEmptyTitle => 'No coupons available';

  @override
  String get couponsEmptyGuest =>
      'Log in to see if there are any exclusive offers available for you.';

  @override
  String get couponsEmptyMessage =>
      'There are no coupons available right now. Check back later for new offers.';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get notFoundMessage => 'The page you are looking for doesn\'t exist.';

  @override
  String get errorGenericTitle => 'Something went wrong';

  @override
  String get errorNetworkTitle => 'No internet connection';

  @override
  String get errorNetworkMessage => 'Check your connection and try again.';

  @override
  String get errorServerMessage =>
      'We couldn\'t complete your request. Please try again.';

  @override
  String get errorUnauthorizedMessage =>
      'Your session has expired. Please log in again.';

  @override
  String get errorValidationMessage => 'Please check the highlighted fields.';

  @override
  String get errorUnexpectedMessage =>
      'An unexpected error occurred. Please try again.';

  @override
  String get homeSelectLocation => 'Select Location';

  @override
  String get homeChangeLocation => 'Change delivery location';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeSearchHint => 'Search';

  @override
  String get homeSearchHighlight => '\"Sparkling Water\"';

  @override
  String get homeFreeDelivery => 'Free delivery on every order';

  @override
  String homeMinimumOrder(String amount) {
    return 'Minimum Order $amount';
  }

  @override
  String get homeCategoriesEyebrow => 'Pure by Nature';

  @override
  String get homeCategoriesTitle => 'Refreshment In Every Drop';

  @override
  String get homeOurBestseller => 'Our Bestseller';

  @override
  String get homeEasyReorder => 'Easy Reorder';

  @override
  String get homeMosqueTitle => 'Nearby mosque delivery';

  @override
  String get homeMosqueSubtitle => 'We deliver water free to nearby mosques';

  @override
  String get homeUpcomingDelivery => 'Upcoming Repeat Delivery';

  @override
  String homeOrderNumber(String number) {
    return 'Order No.: $number';
  }

  @override
  String get homeReorder => 'Reorder';

  @override
  String get homeWhatsNew => 'What\'s New';

  @override
  String get homeBestSellers => 'Best Sellers';

  @override
  String get homeFooterTagline => 'Pure by Nature,\nPerfect by Source.';

  @override
  String get homeFooterOrigin => 'From The Heart Of Qatar';

  @override
  String get homeEmptyTitle => 'Nothing to show yet';

  @override
  String get homeEmptyMessage => 'Pull down to refresh.';

  @override
  String homeBannerLabel(int index, int count) {
    return 'Offer $index of $count';
  }

  @override
  String productBottles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Bottles',
      one: '1 Bottle',
    );
    return '$_temp0';
  }

  @override
  String get productUnitMl => 'ML';

  @override
  String get productAddToCart => 'Add to cart';

  @override
  String get productAddToFavourites => 'Add to favourites';

  @override
  String get commonClose => 'Close';

  @override
  String get commonClear => 'Clear';

  @override
  String get commonClearAll => 'Clear All';

  @override
  String get commonViewAll => 'View All';

  @override
  String get commonSearch => 'Search';

  @override
  String get commonClearSearch => 'Clear search';

  @override
  String get commonLogin => 'Login';

  @override
  String get commonSave => 'Save';

  @override
  String get commonUpdate => 'Update';

  @override
  String get commonDelete => 'Delete';

  @override
  String get commonEdit => 'Edit';

  @override
  String get commonReset => 'Reset';

  @override
  String get commonApply => 'Apply';

  @override
  String get commonBackToTop => 'Back To Top';

  @override
  String get commonMore => 'more';

  @override
  String get commonLess => 'less';

  @override
  String productCups(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Cups',
      one: '1 Cup',
    );
    return '$_temp0';
  }

  @override
  String productSizeLine(int volume, String pack) {
    return '$volume ML x $pack';
  }

  @override
  String productVariantLabel(int volume, int count) {
    return '$volume ML x $count';
  }

  @override
  String get productIncrease => 'Increase quantity';

  @override
  String get productDecrease => 'Decrease quantity';

  @override
  String get productRemoveFromFavourites => 'Remove from favourites';

  @override
  String get productOutOfStock => 'Out Of Stock';

  @override
  String get productNotifyMe => 'Notify Me';

  @override
  String get productNotifyRequested => 'We\'ll Notify You';

  @override
  String get productAddToCartCta => 'ADD TO CART';

  @override
  String favouritesRemoveTitle(String name) {
    return 'Remove $name from Favourites?';
  }

  @override
  String get favouritesRemoveMessage =>
      'Are you sure you want to remove item from your favourite list ?';

  @override
  String get favouritesRemoveAction => 'Remove';

  @override
  String get notificationsTitle => 'Notifications';

  @override
  String get notificationsToday => 'Today';

  @override
  String get notificationsYesterday => 'Yesterday';

  @override
  String get notificationsUnread => 'Unread';

  @override
  String get notificationsEmptyTitle => 'No notifications yet!';

  @override
  String get notificationsEmptyMessage =>
      'Watch this space for some coming your way very very soon..';

  @override
  String get timeJustNow => 'now';

  @override
  String timeMinutesShort(int count) {
    return '${count}m';
  }

  @override
  String timeHoursShort(int count) {
    return '${count}h';
  }

  @override
  String timeDaysShort(int count) {
    return '${count}d';
  }

  @override
  String get authLoginTitle => 'Enter Mobile Number';

  @override
  String get authLoginSubtitle => 'Login with a valid local Mobile Number';

  @override
  String get authMobileHint => 'Mobile Number';

  @override
  String get authIncorrectNumber => 'Incorrect Number';

  @override
  String get authOrLoginWith => 'Or Login With';

  @override
  String get authGoogle => 'Google';

  @override
  String get authApple => 'Apple';

  @override
  String get authOtpTitle => 'Verify Mobile Number';

  @override
  String authOtpSubtitle(int length) {
    return 'Please enter the $length digit OTP sent to';
  }

  @override
  String get authOtpEdit => 'EDIT';

  @override
  String authOtpFieldLabel(int length) {
    return '$length digit OTP';
  }

  @override
  String get authOtpNotReceived => 'Didn’t receive the OTP?';

  @override
  String get authOtpResend => 'Resend';

  @override
  String get authOtpVerify => 'Verify';

  @override
  String get authOtpIncorrect => 'Incorrect OTP';

  @override
  String get authDetailsTitle => 'Fill Your Details';

  @override
  String get authDetailsSubtitle => 'Please enter your details';

  @override
  String get authNameLabel => 'Name';

  @override
  String get authNameHint => 'Enter Your Name';

  @override
  String get authNameMissing => 'Enter your name';

  @override
  String get authMobileLabel => 'Mobile Number';

  @override
  String get authMobileVerified => 'Verified number';

  @override
  String get profileVerified => 'Verified';

  @override
  String get authEmailLabel => 'Email';

  @override
  String get authEmailHint => 'Enter Your Email';

  @override
  String get authEmailMissing => 'Enter your email';

  @override
  String get authEmailIncorrect => 'Incorrect email';

  @override
  String get productsTitle => 'Explore Products';

  @override
  String get productsAll => 'All';

  @override
  String get productsAllProducts => 'All Products';

  @override
  String get productsChangeMosque => 'Change mosque';

  @override
  String productsFoundCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Products found',
      one: '1 Product found',
    );
    return '$_temp0';
  }

  @override
  String searchResultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Results Found',
      one: '1 Result Found',
    );
    return '$_temp0';
  }

  @override
  String get subscribeSaveTag => 'Subscribe & Save';

  @override
  String get subscribeSaveGet => 'Get ';

  @override
  String subscribeSaveOff(int percent) {
    return '$percent% OFF';
  }

  @override
  String get subscribeSaveOn => ' On\n';

  @override
  String get subscribeSaveRecurring => 'Recurring Water';

  @override
  String get subscribeSaveBottles => '\nBottle Deliveries';

  @override
  String get subscribeSaveFrequencies => 'Daily • Weekly • Monthly';

  @override
  String get subscribeSaveAction => 'Subscribe Now';

  @override
  String get productsFilter => 'Filter';

  @override
  String get productsFilterActive => 'Filter, applied';

  @override
  String get productsEmptyTitle => 'No products found';

  @override
  String get productsEmptyMessage =>
      'Try another category or clear the filters.';

  @override
  String get productsClearFilters => 'Clear filters';

  @override
  String get filterTitle => 'Filter';

  @override
  String get filterSizes => 'Sizes';

  @override
  String get filterCategory => 'Category';

  @override
  String get filterBrand => 'Brand';

  @override
  String filterSizeOption(int ml) {
    return '$ml ML';
  }

  @override
  String get searchRecent => 'Recent Search';

  @override
  String searchNotFoundTitle(String query) {
    return 'Oops! We couldn\'t find product matching “$query”';
  }

  @override
  String get searchNotFoundMessage =>
      'Discover something you\'ll love from our categories.';

  @override
  String get productSizes => 'Sizes';

  @override
  String get productAddOns => 'Add-ons';

  @override
  String get productViewCart => 'View Cart';

  @override
  String get productBackInStockHint => 'We\'ll let you know when it\'s back.';

  @override
  String get addressesSearchHint => 'Search for area, street name...';

  @override
  String get addressesCurrentLocation => 'Current Location';

  @override
  String get addressesAddNew => 'Add New Address';

  @override
  String get addressesSaved => 'Saved Addresses';

  @override
  String get addressesSuggestions => 'Suggestions';

  @override
  String get addressesSelected => 'Selected';

  @override
  String addressesMoreOptions(String name) {
    return 'More options for $name';
  }

  @override
  String get addressesGuestTitle => 'Login to Save Your Addresses';

  @override
  String get addressesGuestMessage =>
      'Login to save your addresses and access them easily whenever you need them.';

  @override
  String get addressesEmptyTitle => 'No Saved Addresses';

  @override
  String get addressesEmptyMessage =>
      'Add your address for faster checkout and easier delivery.';

  @override
  String addressesNotFoundTitle(String query) {
    return 'We couldn’t find this location matching “$query”';
  }

  @override
  String get addressesNotFoundMessage =>
      'Try searching the locality/nearby landmark.';

  @override
  String get addressesDeleteTitle => 'Delete this address?';

  @override
  String addressesDeleteMessage(String name) {
    return '$name will be removed from your saved addresses.';
  }

  @override
  String get mapPinHint => 'Move pin to your exact delivery location';

  @override
  String get mapLoginPrompt => 'Login to use your saved addresses';

  @override
  String get mapDeliverHere => 'Order will be delivered here';

  @override
  String get mapConfirm => 'Confirm Location';

  @override
  String get mosquesEmptyTitle => 'No mosques nearby';

  @override
  String get mosquesEmptyMessage =>
      'We couldn\'t find a mosque near you yet. Try again later.';

  @override
  String get mapLocating => 'Finding the address…';

  @override
  String get mapOutsideTitle => 'This location is outside our delivery area';

  @override
  String get mapOutsideMessage =>
      'We currently don’t deliver to this location. Try a nearby location or choose from your saved addresses.';

  @override
  String get mapPlaceholder => 'Map preview. Drag to move the pin.';

  @override
  String get addressFormNewTitle => 'Complete Your Address';

  @override
  String get addressFormEditTitle => 'Edit Your Address';

  @override
  String get addressFormChange => 'Change';

  @override
  String get addressFormPhotosTitle => 'Help drivers Find You Faster!';

  @override
  String get addressFormPhotosMessage =>
      'Add a photo to auto-fill your address.';

  @override
  String get addressFormBluePlate => 'Blue Board Photo';

  @override
  String get addressFormBuildingPhoto => 'Add Building photo';

  @override
  String get addressFormRemovePhoto => 'Remove photo';

  @override
  String get addressFormUploadTitle => 'Upload an Image';

  @override
  String get addressFormCapture => 'Capture';

  @override
  String get addressFormGallery => 'Upload from Gallery';

  @override
  String get addressFormZone => 'Zone';

  @override
  String get addressFormStreet => 'Street';

  @override
  String get addressFormBuilding => 'Building Number';

  @override
  String get addressFormUnit => 'Flat / Unit Number';

  @override
  String get addressFormType => 'Location Type';

  @override
  String get addressFormOther => 'Other';

  @override
  String get addressFormDirections => 'How to Reach (Optional)';

  @override
  String get addressFormDirectionsHint => 'Enter';

  @override
  String get addressFormDefault => 'Set this address as default';

  @override
  String get addressTypeHome => 'Home';

  @override
  String get addressTypeWork => 'Work';

  @override
  String get addressTypeFamily => 'Family';

  @override
  String get addressTypeOther => 'Other';

  @override
  String get addressTypeMosque => 'Mosque';

  @override
  String get favouritesTitle => 'My Favourite';

  @override
  String get favouritesSubtitle => 'We know you love it!';

  @override
  String get favouritesEmptyTitle => 'No favourites yet';

  @override
  String get favouritesEmptyMessage =>
      'Love something? Add it to your favourites for easy access later.';

  @override
  String get favouritesGuestMessage =>
      'Sign up or log in to wishlist items and access them later.';

  @override
  String get favouritesViewProducts => 'View Products';

  @override
  String get checkoutTitle => 'Checkout';

  @override
  String get checkoutEdit => 'EDIT';

  @override
  String get checkoutChange => 'CHANGE';

  @override
  String get checkoutDeliveryMode => 'Delivery Mode';

  @override
  String get checkoutRepeatHint => 'Select Repeat Date & Time of Delivery';

  @override
  String get checkoutDeliverHere => 'We’ll deliver your order here';

  @override
  String get checkoutNoAddress => 'Add an address to deliver to';

  @override
  String get checkoutAwayNotice =>
      'You\'re away from the selected location. Tap change to order from your current location.';

  @override
  String get checkoutOutsideQatarNotice =>
      'You\'re outside Qatar. Tap Change Location to order. Only card payments are available (COD disabled).';

  @override
  String get checkoutInstruction => 'Special Instruction (Optional)';

  @override
  String get checkoutInstructionHint => 'Add special instructions';

  @override
  String get checkoutAdd => 'Add';

  @override
  String get checkoutEditInstruction => 'Edit';

  @override
  String get checkoutBillSummary => 'Bill Summary';

  @override
  String checkoutBillLine(String name, int volume, int pack, int qty) {
    return '$name ($volume ML x $pack) x$qty';
  }

  @override
  String get checkoutRepeatBillNote =>
      'Pay for your recent delivery now. Future payment reminders will appear on My Orders and Home';

  @override
  String get checkoutShowBill => 'Show bill details';

  @override
  String get checkoutHideBill => 'Hide bill details';

  @override
  String get checkoutPaymentMethod => 'Payment Method';

  @override
  String get checkoutPayByCard => 'Pay by Card';

  @override
  String get checkoutSavedCards => 'Saved Cards';

  @override
  String checkoutCardMasked(String brand, String last4) {
    return '$brand •••• •••• •••• $last4';
  }

  @override
  String checkoutCardExpires(String expiry) {
    return 'Expires $expiry';
  }

  @override
  String get checkoutBrandVisa => 'Visa';

  @override
  String get checkoutBrandMastercard => 'Mastercard';

  @override
  String get checkoutBrandAmex => 'Amex';

  @override
  String get checkoutBrandOther => 'Card';

  @override
  String get checkoutCvv => 'CVV';

  @override
  String get checkoutAddNewCard => 'Add New Card';

  @override
  String get checkoutPayByQPay => 'Pay by QPay';

  @override
  String get checkoutQPaySubtitle => 'Pay with your QPay debit card';

  @override
  String get checkoutPayByCash => 'Pay by Cash';

  @override
  String get checkoutCashSubtitle => 'Pay cash directly to driver';

  @override
  String get checkoutTaxNote => 'Prices are inclusive of Taxes';

  @override
  String get checkoutPlaceOrder => 'Place Order';

  @override
  String get checkoutToday => 'Today';

  @override
  String get checkoutTomorrow => 'Tomorrow';

  @override
  String get checkoutAnotherDate => 'Choose Another Date';

  @override
  String checkoutWhenToday(String slot) {
    return 'Today, $slot';
  }

  @override
  String checkoutWhenTomorrow(String slot) {
    return 'Tomorrow, $slot';
  }

  @override
  String checkoutWhenDate(String date, String slot) {
    return '$date | $slot';
  }

  @override
  String checkoutWhenDay(String date, String slot) {
    return '$date, $slot';
  }

  @override
  String get checkoutSlotSheetTitle => 'Select Date & Time For Delivery';

  @override
  String get checkoutDate => 'Date';

  @override
  String get checkoutTimeSlot => 'Time Slot';

  @override
  String get checkoutEstimated => 'Estimated delivery schedule';

  @override
  String get checkoutConfirm => 'Confirm';

  @override
  String get checkoutChangeDate => 'Change date';

  @override
  String get checkoutPrevMonth => 'Previous month';

  @override
  String get checkoutNextMonth => 'Next month';

  @override
  String get checkoutFrequency => 'Frequency';

  @override
  String get checkoutWeekly => 'Weekly';

  @override
  String get checkoutMonthly => 'Monthly';

  @override
  String get checkoutUntilCancel => 'Until I Cancel';

  @override
  String get checkoutInstructionSheetHint => 'Type your special instruction...';

  @override
  String get checkoutChipNoBell => 'Don\'t ring the bell';

  @override
  String get checkoutChipDoor => 'Deliver at the door';

  @override
  String get checkoutChipHand => 'Hand me the order';

  @override
  String checkoutCounter(String count, int max) {
    return '$count/$max';
  }

  @override
  String get checkoutCardNumber => 'Card Number';

  @override
  String get checkoutCardNumberHint => '0000 0000 0000 0000';

  @override
  String get checkoutCardHolder => 'Card Holder Name';

  @override
  String get checkoutExpiry => 'Expiry';

  @override
  String get checkoutExpiryHint => 'MM/YY';

  @override
  String get checkoutSaveCard => 'Save card for future payments';

  @override
  String get paymentDetailsTitle => 'Payment Details';

  @override
  String get paymentHoldOn => 'Hold On!';

  @override
  String get paymentVerifying => 'We are verifying your payment status';

  @override
  String get paymentNoteLabel => 'Note:';

  @override
  String get paymentNoteText =>
      'Do not hit back button or close this screen until the transaction is complete';

  @override
  String get paymentCancelTitle =>
      'Are you sure you want to cancel the payment?';

  @override
  String get paymentCancelMessage =>
      'The payment request will get cancelled as we are confirming your payment status.';

  @override
  String get paymentNotNow => 'Not Now';

  @override
  String get paymentYesCancel => 'Yes, Cancel';

  @override
  String get paymentFailedTitle => 'Your payment failed';

  @override
  String get paymentChangeMethod => 'Change Payment Method';

  @override
  String get receiptItems => 'Items';

  @override
  String receiptQty(String size, String qty) {
    return '$size | Qty $qty';
  }

  @override
  String get orderPlacedTitle => 'Order Placed';

  @override
  String get orderPlacedThanks => 'Thank you for your purchase!';

  @override
  String get receiptSpecialInstruction => 'Special Instruction';

  @override
  String get receiptPaymentMode => 'Payment Mode';

  @override
  String get receiptDeliveryDateTime => 'Delivery Date & Time';

  @override
  String get profileEditTitle => 'Edit Profile';

  @override
  String get commonNotNow => 'Not Now';

  @override
  String get commonGoBack => 'Go Back';

  @override
  String get languageNativeEnglish => 'English';

  @override
  String get languageNativeArabic => 'عربي';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileGuestTitle => 'Guest User';

  @override
  String get profileGuestMessage =>
      'Login or sign up to view your complete profile';

  @override
  String get profileLoginSignUp => 'Login/Sign Up';

  @override
  String get profileChangeLanguage => 'Change language';

  @override
  String get profileLanguageShortEn => 'Eng';

  @override
  String get profileLanguageShortAr => 'عربي';

  @override
  String get profilePointsLabel => 'Points';

  @override
  String profilePointsWorth(String amount) {
    return 'Worth $amount';
  }

  @override
  String profilePointsExpiring(String points, int days) {
    return '$points pts about expire in $days days';
  }

  @override
  String get profileOpenRewards => 'Open rewards';

  @override
  String get profileMyProfile => 'My Profile';

  @override
  String get profileMyOrders => 'My Orders';

  @override
  String get profileSavedAddress => 'Saved Address';

  @override
  String get profileSavedCards => 'Saved Cards';

  @override
  String get profileRewardsOffers => 'Rewards & Offers';

  @override
  String get profileHowToEarn => 'How to Earn & Redeem';

  @override
  String get profileOffers => 'Offers';

  @override
  String get profileSupportMore => 'Support & More';

  @override
  String get profileWhatsApp => 'WhatsApp Support';

  @override
  String get profileTermsPolicies => 'Terms & Policies';

  @override
  String get profileLogout => 'Logout';

  @override
  String get profileChangeLanguageTitle => 'Change Language';

  @override
  String get profileLogoutTitle => 'Are you sure you want to logout?';

  @override
  String get profileLogoutMessage =>
      'You won\'t be able to access your cart and saved items until you log back in.';

  @override
  String get profileWhatsAppUnavailableTitle => 'WhatsApp is not available';

  @override
  String get profileWhatsAppUnavailableMessage =>
      'Install WhatsApp or try again later.';

  @override
  String get commonOk => 'OK';

  @override
  String get profileChangeMobile => 'Change mobile number';

  @override
  String get profileChangeEmail => 'Change email';

  @override
  String get profileChangeMobileTitle =>
      'Are you sure you want to change mobile number?';

  @override
  String get profileChangeMobileMessage =>
      'To change your mobile number, you\'ll first need to verify your existing number.';

  @override
  String get profileYesChange => 'Yes, Change';

  @override
  String get profileVerifyEmailTitle => 'Verify Your Email';

  @override
  String get profileNewMobileTitle => 'Enter New Mobile Number';

  @override
  String get profileNewMobileSubtitle =>
      'Enter the mobile number you\'d like to use for your account.';

  @override
  String get profileNewEmailTitle => 'Enter New Email';

  @override
  String get profileNewEmailSubtitle =>
      'Enter the email you\'d like to use for your account.';

  @override
  String get profileNumberTaken => 'This number already exist';

  @override
  String get profileEmailTaken => 'This email already exists';

  @override
  String get savedAddressesTitle => 'Saved Addresses';

  @override
  String get savedAddressesEmptyTitle => 'No saved addresses';

  @override
  String get savedAddressesEmptyMessage =>
      'Add an address to make checkout faster and easier next time.';

  @override
  String get savedAddressesDeleteTitle =>
      'Are you sure you want to delete this address?';

  @override
  String get savedCardsTitle => 'Saved Cards';

  @override
  String get savedCardsEmptyTitle => 'No saved cards';

  @override
  String get savedCardsGuestMessage =>
      'log in to save your cards and use them for faster checkout.';

  @override
  String get savedCardsEmptyMessage =>
      'Add a card to make checkout faster and easier next time.';

  @override
  String get savedCardsEditTitle => 'Edit Card';

  @override
  String get savedCardsDeleteTitle =>
      'Are you sure you want to delete this card?';

  @override
  String savedCardsMore(String card) {
    return 'More options for $card';
  }

  @override
  String get offersTitle => 'Offers';

  @override
  String get offersAvailable => 'Available Coupons';

  @override
  String get offersCopyCode => 'Copy Code';

  @override
  String get offersTermsTitle => 'Terms & Conditions';

  @override
  String get offersUnderstood => 'Understood';

  @override
  String get policiesTitle => 'Terms & Policies';

  @override
  String get policyAboutUs => 'About Us';

  @override
  String get policyTerms => 'Terms & Conditions';

  @override
  String get policyPrivacy => 'Privacy policy';

  @override
  String get policyRefund => 'Return & Refund Policy';

  @override
  String policyLastUpdated(String date) {
    return 'Last Updated $date';
  }

  @override
  String get deleteAccountLink => 'Delete Account';

  @override
  String get deleteAccountConfirmTitle =>
      'Are you sure you want to delete your account?';

  @override
  String get deleteAccountConfirmMessage =>
      'Deleting account is permanent and all your data with Rayyan Waters will be permanently removed.';

  @override
  String get deleteAccountTitle => 'Delete Account';

  @override
  String get deleteAccountIntro =>
      'Please help us serve you better in future, Thanks.';

  @override
  String get deleteAccountQuestion => 'What Do We Need To Improve?';

  @override
  String get deleteReasonPerformance => 'App\'s Performance';

  @override
  String get deleteReasonPrivacy => 'Privacy concerns';

  @override
  String get deleteReasonProducts => 'Product offerings';

  @override
  String get deleteReasonService => 'Service concerns';

  @override
  String get deleteReasonMultiple => 'Multiple accounts';

  @override
  String get deleteReasonOthers => 'Others';

  @override
  String get deleteAccountSkip => 'Skip & Delete';

  @override
  String get deleteAccountProceed => 'Proceed';

  @override
  String get deletedTitle => 'Your Account Is Scheduled for Deletion';

  @override
  String get deletedMessage =>
      'Changed your mind? Log in within 30 days to recover your account.';

  @override
  String get deletedGoLogin => 'Go to Login';

  @override
  String get deletedContinueGuest => 'Continue As Guest';

  @override
  String get ordersTitle => 'My Orders';

  @override
  String get ordersTabOneTime => 'One Time';

  @override
  String get ordersTabRecurring => 'Recurring';

  @override
  String get ordersFilterAll => 'All';

  @override
  String get ordersFilterDelivered => 'Delivered';

  @override
  String get ordersFilterPickedUp => 'Picked Up';

  @override
  String get ordersFilterConfirmed => 'Confirmed';

  @override
  String get ordersFilterFailed => 'Failed';

  @override
  String get ordersFilterCancelled => 'Cancelled';

  @override
  String get orderStatusConfirmed => 'Order Confirmed';

  @override
  String get orderStatusPickedUp => 'Order Picked Up';

  @override
  String get orderStatusDelivered => 'Delivered';

  @override
  String get orderStatusFailed => 'Delivery Failed';

  @override
  String get orderStatusCancelled => 'Cancelled';

  @override
  String get ordersTagPaid => 'PAID';

  @override
  String get ordersTagCod => 'COD';

  @override
  String ordersItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Items',
      one: '1 Item',
    );
    return '$_temp0';
  }

  @override
  String ordersItemQty(String name, int qty) {
    return '$name (Qty $qty)';
  }

  @override
  String ordersOpen(String status) {
    return 'View details, $status';
  }

  @override
  String get ordersEmptyTitle => 'No Orders';

  @override
  String get ordersEmptyMessage => 'Orders assigned to you will show here.';

  @override
  String get ordersFilterEmpty => 'No orders with this status.';

  @override
  String get ordersRecurringEmptyTitle => 'No recurring orders';

  @override
  String get ordersRecurringEmptyMessage =>
      'Choose Repeat Order at checkout to get water delivered on a schedule.';

  @override
  String get ordersNextDelivery => 'Next Delivery';

  @override
  String subscriptionProgress(int delivered, int total) {
    return '$delivered/$total Delivered';
  }

  @override
  String subscriptionOpenEnded(int delivered) {
    return '$delivered Delivered (until Cancelled)';
  }

  @override
  String subscriptionCancelledProgress(String progress) {
    return 'Cancelled • $progress';
  }

  @override
  String subscriptionPausedProgress(String progress) {
    return 'Paused • $progress';
  }

  @override
  String orderTimeStamp(String date, String time) {
    return '$date | $time';
  }

  @override
  String get orderTypeLabel => 'Order Type';

  @override
  String get orderTypeRecurring => 'Recurring Delivery';

  @override
  String orderItems(int count) {
    return 'Items ($count)';
  }

  @override
  String get orderDriverDetails => 'Driver Details';

  @override
  String get orderCallDriver => 'Call the driver';

  @override
  String get orderPayAtDelivery => 'Pay at the time of delivery';

  @override
  String orderPayWithPoints(String method) {
    return '$method + Points';
  }

  @override
  String get orderPointsRedeemed => 'Points Redeemed';

  @override
  String get orderPointsEarned => 'Points Earned';

  @override
  String get orderPointsRevoked => 'Points Revoked';

  @override
  String orderPointsPlus(String amount) {
    return '+ $amount';
  }

  @override
  String orderPointsMinus(String amount) {
    return '- $amount';
  }

  @override
  String get orderPointsPendingNote =>
      'Reward points will be credited after delivery';

  @override
  String orderPointsCancelledNote(String points) {
    return '$points points reversed due to cancellation';
  }

  @override
  String orderPointsFailedNote(String points) {
    return '$points points reversed as the order failed';
  }

  @override
  String get orderFailedNotice =>
      'Payment failed. If any amount was deducted, it will be automatically refunded to your original payment method.';

  @override
  String get orderCancelledNotice =>
      'Your order has been cancelled. We will reach out to you regarding your refund.';

  @override
  String get orderCancel => 'Cancel';

  @override
  String get orderDownloadInvoice => 'Download Invoice';

  @override
  String get orderPayForDelivery => 'Pay For Delivery';

  @override
  String get orderCancelTitle => 'Are you sure you want to cancel this order?';

  @override
  String get orderCancelMessage =>
      'Once cancelled, this order cannot be restored. Are you sure you want to continue?';

  @override
  String get orderCancelConfirm => 'Yes, Cancel';

  @override
  String get orderLinkFailed => 'Couldn\'t open it. Please try again.';

  @override
  String get subscriptionStatusScheduled => 'Order Scheduled';

  @override
  String get subscriptionStatusCompleted => 'Order Completed';

  @override
  String get subscriptionStatusPaused => 'Order Paused';

  @override
  String get subscriptionPausedNotice =>
      'Your order is paused. To continue delivery, you need to resume it.';

  @override
  String get subscriptionPause => 'Pause';

  @override
  String get subscriptionResume => 'Resume';

  @override
  String get deliveryStatusDelivered => 'Delivered';

  @override
  String get deliveryStatusPickedUp => 'Order Picked Up';

  @override
  String get deliveryStatusYetToDeliver => 'Yet To deliver';

  @override
  String get deliveryStatusPaused => 'Paused';

  @override
  String get deliveryStatusCancelled => 'Cancelled';

  @override
  String deliveryNumbered(int number, int total, String status) {
    return '$number/$total $status';
  }

  @override
  String get deliveryTaxNote => 'Prices are inclusive of Taxes';

  @override
  String get deliveryPayNow => 'Pay Now';

  @override
  String get cancelSubTitle => 'Cancel Subscription';

  @override
  String get cancelReasonTooExpensive => 'Too expensive';

  @override
  String get cancelReasonDelivery => 'Delivery issues';

  @override
  String get cancelReasonSwitching => 'Switching to another provider';

  @override
  String get cancelReasonPausing => 'Pausing temporarily';

  @override
  String get cancelReasonQuality => 'Product quality';

  @override
  String get cancelSubWarning =>
      'This can\'t be undone. Any remaining deliveries are removed.';

  @override
  String get cancelSubPausedNotice =>
      'Cancelling a paused subscription removes the remaining deliveries and closes it for good.';

  @override
  String get cancelSubConfirm => 'Confirm Cancellation';

  @override
  String get refundSummary => 'Refund Summary';

  @override
  String get refundRemaining => 'Deliveries remaining';

  @override
  String refundRemainingValue(int remaining, int total) {
    return '$remaining/$total';
  }

  @override
  String get refundUnused => 'Value of unused deliveries';

  @override
  String get refundDeductions => 'Deductions (policy)';

  @override
  String get refundDue => 'Refund due';

  @override
  String get refundCodNote =>
      'For COD subscriptions there is nothing to refund — future deliveries were never charged.';

  @override
  String get refundConfirm => 'Confirm & refund';

  @override
  String get cancelledTitle => 'Your Subscription Has been Cancelled';

  @override
  String cancelledMessage(String name) {
    return '$name has been cancelled.';
  }

  @override
  String get cancelledOn => 'Cancelled On';

  @override
  String get cancelledRefund => 'Refund';

  @override
  String get cancelledGoHome => 'Go To Home';

  @override
  String get cancelledOrderDetail => 'Order Detail';

  @override
  String get pauseType => 'Pause Type';

  @override
  String get pauseForDeliveries => 'Pause for number of deliveries';

  @override
  String get pauseDaysSkipped => 'Days skipped';

  @override
  String get pauseNextDelivery => 'Next delivery';

  @override
  String get pauseNothingLeft => 'There are no deliveries left to pause.';

  @override
  String get pauseFewer => 'Fewer deliveries';

  @override
  String get pauseMore => 'More deliveries';

  @override
  String get pauseSubmit => 'Pause subscription';

  @override
  String get loyaltyTitle => 'Loyalty Points';

  @override
  String get loyaltyHowTo => 'How to earn and redeem';

  @override
  String get loyaltyTotalAvailable => 'Total Available Points';

  @override
  String loyaltyRate(String amount) {
    return '1pt = $amount';
  }

  @override
  String loyaltyPending(String points) {
    return '+$points Pending Points';
  }

  @override
  String get loyaltyPendingNote => 'Will be credited after delivery';

  @override
  String get loyaltyExpiringSoon => 'Expiring Soon';

  @override
  String get loyaltyPointsExpiringIn => 'points expiring in';

  @override
  String loyaltyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days Days',
      one: '1 Day',
    );
    return '$_temp0';
  }

  @override
  String loyaltyFifoNote(int months) {
    return 'Oldest points are used first (FIFO). Points expire $months months after they\'re earned.';
  }

  @override
  String get loyaltyHowToEarn => 'How To Earn & Redeem';

  @override
  String loyaltyEarnLine(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points Points',
      one: '1 Point',
    );
    return 'Earn $_temp0 for every QAR 1 Spent';
  }

  @override
  String get loyaltyEarnNote => 'Credited once your order is delivered';

  @override
  String loyaltyRedeemLine(String points) {
    return '$points points = QAR 1 off your order';
  }

  @override
  String loyaltyRedeemNote(String min, int percent) {
    return 'Min. $min pts redemption, up to $percent% of cart value';
  }

  @override
  String get loyaltyViewTerms => 'View Full Terms';

  @override
  String get loyaltyHistory => 'Transaction History';

  @override
  String get loyaltyFilterAll => 'All';

  @override
  String get loyaltyFilterEarned => 'Earned';

  @override
  String get loyaltyFilterRedeemed => 'Redeemed';

  @override
  String get loyaltyFilterExpired => 'Expired';

  @override
  String get loyaltyTxEarned => 'Earned';

  @override
  String get loyaltyTxRedeemed => 'Redeemed';

  @override
  String loyaltyTxExpired(int months) {
    return 'Expired ($months months)';
  }

  @override
  String get loyaltyTxRefund => 'Refund';

  @override
  String loyaltyTxMeta(String date, String reference) {
    return '$date • $reference';
  }

  @override
  String get loyaltyHistoryEmpty => 'No points activity yet.';

  @override
  String get howTitle => 'How to Earn & Redeem';

  @override
  String get howSubtitle => 'Full transparency on your loyalty benefits';

  @override
  String get howEarningTitle => 'Earning Points';

  @override
  String howEarningTag(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points Points',
      one: '1 Point',
    );
    return '1 QAR = $_temp0';
  }

  @override
  String howEarningBody(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points points',
      one: '1 point',
    );
    return 'Earn $_temp0 for every QAR 1 spent on eligible purchases';
  }

  @override
  String get howRedeemTitle => 'Redeeming Points';

  @override
  String howRedeemTag(String amount) {
    return '1 Point = $amount';
  }

  @override
  String howRedeemBody(String amount) {
    return 'Each point is worth $amount when redeemed at checkout';
  }

  @override
  String get howValidityTitle => 'Points Validity';

  @override
  String howValidityTag(int months) {
    return 'Valid for $months months';
  }

  @override
  String howValidityBody(int months) {
    return 'Points expire $months months after earning. Oldest points are used first (FIFO)';
  }

  @override
  String get howRulesTitle => 'Redemption Rules';

  @override
  String get howMinimumLabel => 'Minimum';

  @override
  String howMinimumValue(String points) {
    return '$points points';
  }

  @override
  String get howMaximumLabel => 'Maximum';

  @override
  String howMaximumValue(int percent) {
    return '$percent% of cart';
  }

  @override
  String get howMultiplesLabel => 'Use points in multiples of';

  @override
  String get howExampleTitle => 'Example';

  @override
  String howExampleBody(String order, String max, String points, String min) {
    return 'On a $order order, your max redemption is $max ($points pts) — well above the $min-point minimum, so you\'re free to redeem anywhere in between.';
  }

  @override
  String get howExclusions => 'Exclusions';

  @override
  String get howExDelivery => 'Delivery fees';

  @override
  String get howExDeliveryNote => 'Excluded from points calculation';

  @override
  String get howExCod => 'Cash on Delivery (COD) fees';

  @override
  String get howExCodNote => 'Can\'t be offset with points';

  @override
  String get howExDiscounted => 'Already discounted items';

  @override
  String get howExDiscountedNote =>
      'Promotional SKUs don\'t earn or accept points';

  @override
  String get howExGift => 'Gift cards';

  @override
  String get howExGiftNote => 'Excluded from loyalty benefits';

  @override
  String get cartUsePoints => 'Use Loyalty Points';

  @override
  String get cartAvailablePoints => 'Available Points';

  @override
  String cartPointsBalance(String points) {
    return '$points Pts';
  }

  @override
  String get cartRedeemPoints => 'Redeem points';

  @override
  String cartRedeemHint(String points, String amount) {
    return 'Use $points points to Save $amount';
  }

  @override
  String get cartEnterPoints => 'Enter points to redeem';

  @override
  String cartPointsRange(String min, String max) {
    return 'Min $min Pts • Max $max pts';
  }

  @override
  String get cartPointsSuffix => 'pts';

  @override
  String cartPointsInvalid(String step, String min, String max) {
    return 'Enter a multiple of $step from $min to $max.';
  }

  @override
  String get cartPointsPromo =>
      'Points cannot be redeemed on promotional or discounted items in your cart.';

  @override
  String cartPointsNotEnough(String min) {
    return 'You need at least $min points to redeem rewards on this order.';
  }

  @override
  String cartPointsCartSmall(String min) {
    return 'Add more items to redeem points. At least $min points are needed.';
  }

  @override
  String cartEarnNote(int points, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points Points',
      one: '1 Point',
    );
    return 'Wow! Earn $_temp0, where 1 Point = $amount in value';
  }

  @override
  String get orderPlacedOn => 'Placed On';

  @override
  String get orderPaymentStatus => 'Payment Status';

  @override
  String get ordersTagPending => 'Pending';

  @override
  String get orderTypeDeliverNow => 'Deliver Now';

  @override
  String get scheduleTitle => 'Schedule Delivery';

  @override
  String scheduleDeliveryDays(int count) {
    return 'Delivery Days (Max $count Days)';
  }

  @override
  String get scheduleDeliveryPeriod => 'Delivery Period';

  @override
  String get scheduleStartDate => 'Start Date';

  @override
  String get scheduleDeliverUntil => 'Deliver Until';

  @override
  String get scheduleSelect => 'Select';

  @override
  String schedulePerWeek(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Deliveries a week',
      one: '1 Delivery a week',
    );
    return '$_temp0';
  }

  @override
  String schedulePerMonth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Deliveries a month',
      one: '1 Delivery a month',
    );
    return '$_temp0';
  }

  @override
  String scheduleWeekdayCount(int count, String day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ${day}s',
      one: '1 $day',
    );
    return '$_temp0';
  }

  @override
  String scheduleDateCount(int count, String day) {
    return '$count × $day';
  }

  @override
  String scheduleAnd(String first, String second) {
    return '$first & $second';
  }

  @override
  String scheduleSummary(String count, String days, String from, String to) {
    return 'You will receive $count deliveries, every $days from $from to $to';
  }

  @override
  String scheduleSummaryOpen(String days, String from) {
    return 'You will receive deliveries every $days from $from until you cancel';
  }

  @override
  String get scheduleNoFeb =>
      'Please note that month of February does not have days beyond 28';

  @override
  String get scheduleNo31 => 'Please note that not all months have 31 days';

  @override
  String scheduleMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Months',
      one: '1 Month',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomEnd => 'Custom End Date';

  @override
  String scheduleUntil(String period) {
    return 'Until $period';
  }

  @override
  String get scheduleSlotTitle => 'Delivery Slot';

  @override
  String scheduleWeekly(String days) {
    return 'Weekly, $days';
  }

  @override
  String scheduleMonthly(String days) {
    return 'Monthly, $days';
  }

  @override
  String get checkoutDeliverNow => 'Deliver Now';

  @override
  String get checkoutDeliverNowHint => 'Select Date & Time of Delivery';

  @override
  String get checkoutPaymentType => 'Payment Type';

  @override
  String get payTypeTitle => 'Select Payment Type';

  @override
  String get payTypeAsYouGo => 'Pay as you go';

  @override
  String get payTypeAsYouGoBody =>
      'Pay only for the next delivery. We’ll send a payment link before each subsequent delivery.';

  @override
  String payTypeToday(String amount) {
    return '$amount Today';
  }

  @override
  String get payTypeUpfront => 'Pay upfront';

  @override
  String get payTypeUpfrontBody =>
      'Pay all deliveries in the next 4 weeks, or next month\'s deliveries.';

  @override
  String payTypeUpfrontTotal(int count, String price, String total) {
    return '$count Deliveries × $price = $total';
  }

  @override
  String deliveryPayBefore(String when) {
    return 'Pay before $when to receive your order';
  }

  @override
  String get upfrontCardTitle => 'Pay Upfront';

  @override
  String get cancelDeliveryTitle => 'Cancel Delivery';

  @override
  String get cancelDeliveryAll => 'Cancel all deliveries';

  @override
  String get cancelDeliverySelect => 'Select Date';

  @override
  String get cancelDeliveryNote =>
      'Deliveries for your selected dates will be cancelled';

  @override
  String get pauseDeliveryTitle => 'Pause Delivery';

  @override
  String get pauseDateRange => 'Pause Date Range';

  @override
  String get pauseRecovery => 'Choose Recovery';

  @override
  String get pauseRefund => 'I Want Refund';

  @override
  String get pauseRefundAmount => 'Refund Amount';

  @override
  String pauseRefundLine(int count, String price) {
    return '$count Deliveries × $price';
  }

  @override
  String get pauseExtend => 'Extend Dates';

  @override
  String get pauseExtendedTill => 'Extended Till';

  @override
  String get pauseSummary => 'Summary';

  @override
  String pauseRangeNote(String from, String to) {
    return 'All your deliveries from $from to $to will be Paused';
  }

  @override
  String get pauseRangeTitle => 'Select Pause Until Date';

  @override
  String get pauseStart => 'Start Date';

  @override
  String get pauseEnd => 'End Date';

  @override
  String pauseDaysValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Days',
      one: '1 Day',
    );
    return '$_temp0';
  }

  @override
  String get resumeTitle => 'Select Resume Date';

  @override
  String get resumeFrom => 'From';

  @override
  String get resumeTo => 'To';

  @override
  String resumeNote(String from, String to) {
    return 'All your deliveries from $from to $to will be resumed';
  }

  @override
  String get paymentCancelledTitle => 'Your payment cancelled';

  @override
  String scheduleSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count deliveries',
      one: '1 delivery',
    );
    return '$_temp0';
  }

  @override
  String get splashTagline => 'A hero behind every drop';

  @override
  String get homeCurrentTime => 'Current Time';

  @override
  String get homeTodaysOrders => 'Todays Orders';

  @override
  String ordersFilterCount(String label, int count) {
    return '$label ($count)';
  }

  @override
  String get orderHistoryTitle => 'Order History';

  @override
  String get ordersSearchHint => 'Search Order';

  @override
  String get pastOrdersTitle => 'Past Orders';

  @override
  String get reassignedTitle => 'Re-Assigned';

  @override
  String get orderStatusNewOrder => 'New Order';

  @override
  String get orderStatusOrderPicked => 'Order Picked';

  @override
  String get orderStatusDropOff => 'Drop Off';

  @override
  String get orderStatusReassigned => 'Re-Assigned';

  @override
  String orderNumber(String number) {
    return '#$number';
  }

  @override
  String get paymentPaid => 'PAID';

  @override
  String get paymentPending => 'PENDING';

  @override
  String get paymentStatusLabel => 'Payment Status';

  @override
  String get orderDeliveryDateTime => 'Delivery Date & Time';

  @override
  String get orderAssignedOn => 'Assigned On';

  @override
  String get orderDetailTitle => 'Order Detail';

  @override
  String get orderTotalItems => 'Total Items';

  @override
  String orderItemPack(int volume, int bottles) {
    return '$volume ML x $bottles Bottles';
  }

  @override
  String orderItemQuantity(String quantity) {
    return 'Qty $quantity';
  }

  @override
  String get orderDeliveryLocation => 'Delivery Location';

  @override
  String get orderLocationPhotos => 'This will help you reach faster!';

  @override
  String get orderCustomerDetail => 'Customer Detail';

  @override
  String get orderSpecialInstruction => 'Special Instruction';

  @override
  String get orderReasonReassign => 'Reason for reassign';

  @override
  String get orderReasonFail => 'Reason for fail delivery';

  @override
  String get orderReassign => 'Re-Assign';

  @override
  String get orderContactSupport => 'Contact Support';

  @override
  String get orderFailDelivery => 'Fail Delivery';

  @override
  String get orderMarkDelivered => 'Mark As Deliver';

  @override
  String get orderCashCollected => 'Cash Collected';

  @override
  String get orderTotalAmount => 'Total Amount';

  @override
  String get orderDirections => 'Directions';

  @override
  String get orderCallCustomer => 'Call customer';

  @override
  String get reassignTitle => 'Re-Assign Order';

  @override
  String get reassignMessage =>
      'Are you sure you want to re-assign this order to another driver?';

  @override
  String get reassignReasonHint => 'Leave Reason';

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonSubmit => 'Submit';

  @override
  String get failDeliveryTitle => 'Fail Delivery';

  @override
  String get failDeliveryPrompt => 'Select A Reason For Failing This Delivery.';

  @override
  String get failReasonCustomerNotAvailable => 'Customer not available';

  @override
  String get failReasonWrongAddress => 'Wrong address provided';

  @override
  String get failReasonAccessDenied => 'Access denied / No entry';

  @override
  String get failReasonPackageDamaged => 'Package damaged';

  @override
  String get failReasonRefused => 'Refused delivery';

  @override
  String get failReasonOther => 'Others';

  @override
  String get failReasonHint => 'Reason';

  @override
  String get profileMyDetails => 'My Details';

  @override
  String get profilePrivacyPolicies => 'Privacy & Policies';

  @override
  String get faqsTitle => 'FAQs';

  @override
  String get faqsSubtitle => 'Frequently asked questions';

  @override
  String get faqsEmpty => 'No questions yet';

  @override
  String get detailsEmail => 'Email';

  @override
  String get detailsMobile => 'Mobile Number';

  @override
  String get detailsZone => 'Zone';

  @override
  String get detailsRouteId => 'Route ID';

  @override
  String get detailsVehicleNumber => 'Vehicle Number';

  @override
  String get failReasonRequired => 'Select a reason for this failed delivery.';
}
