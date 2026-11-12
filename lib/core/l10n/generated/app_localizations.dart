import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Rayyan E-Fleet'**
  String get appName;

  /// No description provided for @commonRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get commonRetry;

  /// No description provided for @commonContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get commonContinue;

  /// No description provided for @commonBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get commonBack;

  /// No description provided for @commonGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get commonGoHome;

  /// No description provided for @onboardingWelcomeTo.
  ///
  /// In en, this message translates to:
  /// **'Welcome to'**
  String get onboardingWelcomeTo;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Rayyan Water World'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingTagline.
  ///
  /// In en, this message translates to:
  /// **'~ Your Daily Drop of Nature ~'**
  String get onboardingTagline;

  /// No description provided for @onboardingChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose language'**
  String get onboardingChooseLanguage;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get languageArabic;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navProducts.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get navProducts;

  /// No description provided for @navCart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get navCart;

  /// No description provided for @navFavourite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get navFavourite;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @cartTitle.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get cartTitle;

  /// No description provided for @cartTitleCount.
  ///
  /// In en, this message translates to:
  /// **'My Cart ({count})'**
  String cartTitleCount(int count);

  /// No description provided for @cartEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your cart is currently empty'**
  String get cartEmptyTitle;

  /// No description provided for @cartEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Looks like you haven’t added any product to your cart yet.'**
  String get cartEmptyMessage;

  /// No description provided for @cartViewProducts.
  ///
  /// In en, this message translates to:
  /// **'View Products'**
  String get cartViewProducts;

  /// No description provided for @cartAddItem.
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get cartAddItem;

  /// No description provided for @cartCouponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get cartCouponCode;

  /// No description provided for @cartApplyCoupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get cartApplyCoupon;

  /// No description provided for @cartViewAllCoupons.
  ///
  /// In en, this message translates to:
  /// **'View All Coupons'**
  String get cartViewAllCoupons;

  /// No description provided for @cartRemoveCoupon.
  ///
  /// In en, this message translates to:
  /// **'Remove coupon'**
  String get cartRemoveCoupon;

  /// No description provided for @cartOrderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get cartOrderSummary;

  /// No description provided for @cartItemTotal.
  ///
  /// In en, this message translates to:
  /// **'Item Total'**
  String get cartItemTotal;

  /// No description provided for @cartDiscount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get cartDiscount;

  /// No description provided for @cartDiscountValue.
  ///
  /// In en, this message translates to:
  /// **'- {amount}'**
  String cartDiscountValue(String amount);

  /// No description provided for @cartDeliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get cartDeliveryFee;

  /// No description provided for @cartVat.
  ///
  /// In en, this message translates to:
  /// **'VAT'**
  String get cartVat;

  /// No description provided for @cartTotal.
  ///
  /// In en, this message translates to:
  /// **'Total (Tax Included)'**
  String get cartTotal;

  /// No description provided for @cartCheckout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get cartCheckout;

  /// No description provided for @cartLoginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Login to Continue'**
  String get cartLoginToContinue;

  /// No description provided for @cartMinimumTitle.
  ///
  /// In en, this message translates to:
  /// **'Shop {amount} More to unlock'**
  String cartMinimumTitle(String amount);

  /// No description provided for @cartMinimumMessage.
  ///
  /// In en, this message translates to:
  /// **'Add more to reach minimum order'**
  String get cartMinimumMessage;

  /// No description provided for @cartPriceChanged.
  ///
  /// In en, this message translates to:
  /// **'Product price changed to {price}'**
  String cartPriceChanged(String price);

  /// No description provided for @cartUnavailable.
  ///
  /// In en, this message translates to:
  /// **'This product is no longer available'**
  String get cartUnavailable;

  /// No description provided for @cartRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get cartRemove;

  /// No description provided for @cartPriceChangedQuestion.
  ///
  /// In en, this message translates to:
  /// **'Do you still want to continue?'**
  String get cartPriceChangedQuestion;

  /// No description provided for @cartRemoveItem.
  ///
  /// In en, this message translates to:
  /// **'Remove Item'**
  String get cartRemoveItem;

  /// No description provided for @couponsTitle.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponsTitle;

  /// No description provided for @couponsInputHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Coupon Code'**
  String get couponsInputHint;

  /// No description provided for @couponsApplyList.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupons'**
  String get couponsApplyList;

  /// No description provided for @couponsNotApplicable.
  ///
  /// In en, this message translates to:
  /// **'This Coupon is not applicable'**
  String get couponsNotApplicable;

  /// No description provided for @couponsTerms.
  ///
  /// In en, this message translates to:
  /// **'T&C'**
  String get couponsTerms;

  /// No description provided for @couponsRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get couponsRemove;

  /// No description provided for @couponsClearCode.
  ///
  /// In en, this message translates to:
  /// **'Clear code'**
  String get couponsClearCode;

  /// No description provided for @couponsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No coupons available'**
  String get couponsEmptyTitle;

  /// No description provided for @couponsEmptyGuest.
  ///
  /// In en, this message translates to:
  /// **'Log in to see if there are any exclusive offers available for you.'**
  String get couponsEmptyGuest;

  /// No description provided for @couponsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'There are no coupons available right now. Check back later for new offers.'**
  String get couponsEmptyMessage;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundTitle;

  /// No description provided for @notFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for doesn\'t exist.'**
  String get notFoundMessage;

  /// No description provided for @errorGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorGenericTitle;

  /// No description provided for @errorNetworkTitle.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get errorNetworkTitle;

  /// No description provided for @errorNetworkMessage.
  ///
  /// In en, this message translates to:
  /// **'Check your connection and try again.'**
  String get errorNetworkMessage;

  /// No description provided for @errorServerMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t complete your request. Please try again.'**
  String get errorServerMessage;

  /// No description provided for @errorUnauthorizedMessage.
  ///
  /// In en, this message translates to:
  /// **'Your session has expired. Please log in again.'**
  String get errorUnauthorizedMessage;

  /// No description provided for @errorValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check the highlighted fields.'**
  String get errorValidationMessage;

  /// No description provided for @errorUnexpectedMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorUnexpectedMessage;

  /// No description provided for @homeSelectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location'**
  String get homeSelectLocation;

  /// No description provided for @homeChangeLocation.
  ///
  /// In en, this message translates to:
  /// **'Change delivery location'**
  String get homeChangeLocation;

  /// No description provided for @homeNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get homeSearchHint;

  /// No description provided for @homeSearchHighlight.
  ///
  /// In en, this message translates to:
  /// **'\"Sparkling Water\"'**
  String get homeSearchHighlight;

  /// No description provided for @homeFreeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery on every order'**
  String get homeFreeDelivery;

  /// No description provided for @homeMinimumOrder.
  ///
  /// In en, this message translates to:
  /// **'Minimum Order {amount}'**
  String homeMinimumOrder(String amount);

  /// No description provided for @homeCategoriesEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Pure by Nature'**
  String get homeCategoriesEyebrow;

  /// No description provided for @homeCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Refreshment In Every Drop'**
  String get homeCategoriesTitle;

  /// No description provided for @homeOurBestseller.
  ///
  /// In en, this message translates to:
  /// **'Our Bestseller'**
  String get homeOurBestseller;

  /// No description provided for @homeEasyReorder.
  ///
  /// In en, this message translates to:
  /// **'Easy Reorder'**
  String get homeEasyReorder;

  /// No description provided for @homeMosqueTitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby mosque delivery'**
  String get homeMosqueTitle;

  /// No description provided for @homeMosqueSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We deliver water free to nearby mosques'**
  String get homeMosqueSubtitle;

  /// No description provided for @homeUpcomingDelivery.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Repeat Delivery'**
  String get homeUpcomingDelivery;

  /// No description provided for @homeOrderNumber.
  ///
  /// In en, this message translates to:
  /// **'Order No.: {number}'**
  String homeOrderNumber(String number);

  /// No description provided for @homeReorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get homeReorder;

  /// No description provided for @homeWhatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s New'**
  String get homeWhatsNew;

  /// No description provided for @homeBestSellers.
  ///
  /// In en, this message translates to:
  /// **'Best Sellers'**
  String get homeBestSellers;

  /// No description provided for @homeFooterTagline.
  ///
  /// In en, this message translates to:
  /// **'Pure by Nature,\nPerfect by Source.'**
  String get homeFooterTagline;

  /// No description provided for @homeFooterOrigin.
  ///
  /// In en, this message translates to:
  /// **'From The Heart Of Qatar'**
  String get homeFooterOrigin;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Nothing to show yet'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Pull down to refresh.'**
  String get homeEmptyMessage;

  /// No description provided for @homeBannerLabel.
  ///
  /// In en, this message translates to:
  /// **'Offer {index} of {count}'**
  String homeBannerLabel(int index, int count);

  /// No description provided for @productBottles.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Bottle} other{{count} Bottles}}'**
  String productBottles(int count);

  /// No description provided for @productUnitMl.
  ///
  /// In en, this message translates to:
  /// **'ML'**
  String get productUnitMl;

  /// No description provided for @productAddToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get productAddToCart;

  /// No description provided for @productAddToFavourites.
  ///
  /// In en, this message translates to:
  /// **'Add to favourites'**
  String get productAddToFavourites;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @commonClear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get commonClear;

  /// No description provided for @commonClearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get commonClearAll;

  /// No description provided for @commonViewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get commonViewAll;

  /// No description provided for @commonSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get commonSearch;

  /// No description provided for @commonClearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get commonClearSearch;

  /// No description provided for @commonLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get commonLogin;

  /// No description provided for @commonSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get commonSave;

  /// No description provided for @commonUpdate.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get commonUpdate;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;

  /// No description provided for @commonEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get commonEdit;

  /// No description provided for @commonReset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get commonReset;

  /// No description provided for @commonApply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get commonApply;

  /// No description provided for @commonBackToTop.
  ///
  /// In en, this message translates to:
  /// **'Back To Top'**
  String get commonBackToTop;

  /// No description provided for @commonMore.
  ///
  /// In en, this message translates to:
  /// **'more'**
  String get commonMore;

  /// No description provided for @commonLess.
  ///
  /// In en, this message translates to:
  /// **'less'**
  String get commonLess;

  /// No description provided for @productCups.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Cup} other{{count} Cups}}'**
  String productCups(int count);

  /// No description provided for @productSizeLine.
  ///
  /// In en, this message translates to:
  /// **'{volume} ML x {pack}'**
  String productSizeLine(int volume, String pack);

  /// No description provided for @productVariantLabel.
  ///
  /// In en, this message translates to:
  /// **'{volume} ML x {count}'**
  String productVariantLabel(int volume, int count);

  /// No description provided for @productIncrease.
  ///
  /// In en, this message translates to:
  /// **'Increase quantity'**
  String get productIncrease;

  /// No description provided for @productDecrease.
  ///
  /// In en, this message translates to:
  /// **'Decrease quantity'**
  String get productDecrease;

  /// No description provided for @productRemoveFromFavourites.
  ///
  /// In en, this message translates to:
  /// **'Remove from favourites'**
  String get productRemoveFromFavourites;

  /// No description provided for @productOutOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out Of Stock'**
  String get productOutOfStock;

  /// No description provided for @productNotifyMe.
  ///
  /// In en, this message translates to:
  /// **'Notify Me'**
  String get productNotifyMe;

  /// No description provided for @productNotifyRequested.
  ///
  /// In en, this message translates to:
  /// **'We\'ll Notify You'**
  String get productNotifyRequested;

  /// No description provided for @productAddToCartCta.
  ///
  /// In en, this message translates to:
  /// **'ADD TO CART'**
  String get productAddToCartCta;

  /// No description provided for @favouritesRemoveTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove {name} from Favourites?'**
  String favouritesRemoveTitle(String name);

  /// No description provided for @favouritesRemoveMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove item from your favourite list ?'**
  String get favouritesRemoveMessage;

  /// No description provided for @favouritesRemoveAction.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get favouritesRemoveAction;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsTitle;

  /// No description provided for @notificationsToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get notificationsToday;

  /// No description provided for @notificationsYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notificationsYesterday;

  /// No description provided for @notificationsUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get notificationsUnread;

  /// No description provided for @notificationsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet!'**
  String get notificationsEmptyTitle;

  /// No description provided for @notificationsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Watch this space for some coming your way very very soon..'**
  String get notificationsEmptyMessage;

  /// No description provided for @timeJustNow.
  ///
  /// In en, this message translates to:
  /// **'now'**
  String get timeJustNow;

  /// No description provided for @timeMinutesShort.
  ///
  /// In en, this message translates to:
  /// **'{count}m'**
  String timeMinutesShort(int count);

  /// No description provided for @timeHoursShort.
  ///
  /// In en, this message translates to:
  /// **'{count}h'**
  String timeHoursShort(int count);

  /// No description provided for @timeDaysShort.
  ///
  /// In en, this message translates to:
  /// **'{count}d'**
  String timeDaysShort(int count);

  /// No description provided for @authLoginTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get authLoginTitle;

  /// No description provided for @authLoginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Login with a valid local Mobile Number'**
  String get authLoginSubtitle;

  /// No description provided for @authMobileHint.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get authMobileHint;

  /// No description provided for @authIncorrectNumber.
  ///
  /// In en, this message translates to:
  /// **'Incorrect Number'**
  String get authIncorrectNumber;

  /// No description provided for @authOrLoginWith.
  ///
  /// In en, this message translates to:
  /// **'Or Login With'**
  String get authOrLoginWith;

  /// No description provided for @authGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get authGoogle;

  /// No description provided for @authApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get authApple;

  /// No description provided for @authOtpTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Mobile Number'**
  String get authOtpTitle;

  /// No description provided for @authOtpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter the {length} digit OTP sent to'**
  String authOtpSubtitle(int length);

  /// No description provided for @authOtpEdit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get authOtpEdit;

  /// No description provided for @authOtpFieldLabel.
  ///
  /// In en, this message translates to:
  /// **'{length} digit OTP'**
  String authOtpFieldLabel(int length);

  /// No description provided for @authOtpNotReceived.
  ///
  /// In en, this message translates to:
  /// **'Didn’t receive the OTP?'**
  String get authOtpNotReceived;

  /// No description provided for @authOtpResend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get authOtpResend;

  /// No description provided for @authOtpVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get authOtpVerify;

  /// No description provided for @authOtpIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect OTP'**
  String get authOtpIncorrect;

  /// No description provided for @authDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Fill Your Details'**
  String get authDetailsTitle;

  /// No description provided for @authDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter your details'**
  String get authDetailsSubtitle;

  /// No description provided for @authNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get authNameLabel;

  /// No description provided for @authNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get authNameHint;

  /// No description provided for @authNameMissing.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get authNameMissing;

  /// No description provided for @authMobileLabel.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get authMobileLabel;

  /// No description provided for @authMobileVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified number'**
  String get authMobileVerified;

  /// No description provided for @profileVerified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get profileVerified;

  /// No description provided for @authEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmailLabel;

  /// No description provided for @authEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Email'**
  String get authEmailHint;

  /// No description provided for @authEmailMissing.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEmailMissing;

  /// No description provided for @authEmailIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email'**
  String get authEmailIncorrect;

  /// No description provided for @productsTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore Products'**
  String get productsTitle;

  /// No description provided for @productsAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get productsAll;

  /// No description provided for @productsAllProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get productsAllProducts;

  /// No description provided for @productsChangeMosque.
  ///
  /// In en, this message translates to:
  /// **'Change mosque'**
  String get productsChangeMosque;

  /// No description provided for @productsFoundCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Product found} other{{count} Products found}}'**
  String productsFoundCount(int count);

  /// No description provided for @searchResultsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Result Found} other{{count} Results Found}}'**
  String searchResultsCount(int count);

  /// No description provided for @subscribeSaveTag.
  ///
  /// In en, this message translates to:
  /// **'Subscribe & Save'**
  String get subscribeSaveTag;

  /// No description provided for @subscribeSaveGet.
  ///
  /// In en, this message translates to:
  /// **'Get '**
  String get subscribeSaveGet;

  /// No description provided for @subscribeSaveOff.
  ///
  /// In en, this message translates to:
  /// **'{percent}% OFF'**
  String subscribeSaveOff(int percent);

  /// No description provided for @subscribeSaveOn.
  ///
  /// In en, this message translates to:
  /// **' On\n'**
  String get subscribeSaveOn;

  /// No description provided for @subscribeSaveRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring Water'**
  String get subscribeSaveRecurring;

  /// No description provided for @subscribeSaveBottles.
  ///
  /// In en, this message translates to:
  /// **'\nBottle Deliveries'**
  String get subscribeSaveBottles;

  /// No description provided for @subscribeSaveFrequencies.
  ///
  /// In en, this message translates to:
  /// **'Daily • Weekly • Monthly'**
  String get subscribeSaveFrequencies;

  /// No description provided for @subscribeSaveAction.
  ///
  /// In en, this message translates to:
  /// **'Subscribe Now'**
  String get subscribeSaveAction;

  /// No description provided for @productsFilter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get productsFilter;

  /// No description provided for @productsFilterActive.
  ///
  /// In en, this message translates to:
  /// **'Filter, applied'**
  String get productsFilterActive;

  /// No description provided for @productsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get productsEmptyTitle;

  /// No description provided for @productsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Try another category or clear the filters.'**
  String get productsEmptyMessage;

  /// No description provided for @productsClearFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear filters'**
  String get productsClearFilters;

  /// No description provided for @filterTitle.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filterTitle;

  /// No description provided for @filterSizes.
  ///
  /// In en, this message translates to:
  /// **'Sizes'**
  String get filterSizes;

  /// No description provided for @filterCategory.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get filterCategory;

  /// No description provided for @filterBrand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get filterBrand;

  /// No description provided for @filterSizeOption.
  ///
  /// In en, this message translates to:
  /// **'{ml} ML'**
  String filterSizeOption(int ml);

  /// No description provided for @searchRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent Search'**
  String get searchRecent;

  /// No description provided for @searchNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! We couldn\'t find product matching “{query}”'**
  String searchNotFoundTitle(String query);

  /// No description provided for @searchNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Discover something you\'ll love from our categories.'**
  String get searchNotFoundMessage;

  /// No description provided for @productSizes.
  ///
  /// In en, this message translates to:
  /// **'Sizes'**
  String get productSizes;

  /// No description provided for @productAddOns.
  ///
  /// In en, this message translates to:
  /// **'Add-ons'**
  String get productAddOns;

  /// No description provided for @productViewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get productViewCart;

  /// No description provided for @productBackInStockHint.
  ///
  /// In en, this message translates to:
  /// **'We\'ll let you know when it\'s back.'**
  String get productBackInStockHint;

  /// No description provided for @addressesSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for area, street name...'**
  String get addressesSearchHint;

  /// No description provided for @addressesCurrentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get addressesCurrentLocation;

  /// No description provided for @addressesAddNew.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addressesAddNew;

  /// No description provided for @addressesSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get addressesSaved;

  /// No description provided for @addressesSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get addressesSuggestions;

  /// No description provided for @addressesSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get addressesSelected;

  /// No description provided for @addressesMoreOptions.
  ///
  /// In en, this message translates to:
  /// **'More options for {name}'**
  String addressesMoreOptions(String name);

  /// No description provided for @addressesGuestTitle.
  ///
  /// In en, this message translates to:
  /// **'Login to Save Your Addresses'**
  String get addressesGuestTitle;

  /// No description provided for @addressesGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'Login to save your addresses and access them easily whenever you need them.'**
  String get addressesGuestMessage;

  /// No description provided for @addressesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Saved Addresses'**
  String get addressesEmptyTitle;

  /// No description provided for @addressesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add your address for faster checkout and easier delivery.'**
  String get addressesEmptyMessage;

  /// No description provided for @addressesNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'We couldn’t find this location matching “{query}”'**
  String addressesNotFoundTitle(String query);

  /// No description provided for @addressesNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'Try searching the locality/nearby landmark.'**
  String get addressesNotFoundMessage;

  /// No description provided for @addressesDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this address?'**
  String get addressesDeleteTitle;

  /// No description provided for @addressesDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} will be removed from your saved addresses.'**
  String addressesDeleteMessage(String name);

  /// No description provided for @mapPinHint.
  ///
  /// In en, this message translates to:
  /// **'Move pin to your exact delivery location'**
  String get mapPinHint;

  /// No description provided for @mapLoginPrompt.
  ///
  /// In en, this message translates to:
  /// **'Login to use your saved addresses'**
  String get mapLoginPrompt;

  /// No description provided for @mapDeliverHere.
  ///
  /// In en, this message translates to:
  /// **'Order will be delivered here'**
  String get mapDeliverHere;

  /// No description provided for @mapConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get mapConfirm;

  /// No description provided for @mosquesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No mosques nearby'**
  String get mosquesEmptyTitle;

  /// No description provided for @mosquesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find a mosque near you yet. Try again later.'**
  String get mosquesEmptyMessage;

  /// No description provided for @mapLocating.
  ///
  /// In en, this message translates to:
  /// **'Finding the address…'**
  String get mapLocating;

  /// No description provided for @mapOutsideTitle.
  ///
  /// In en, this message translates to:
  /// **'This location is outside our delivery area'**
  String get mapOutsideTitle;

  /// No description provided for @mapOutsideMessage.
  ///
  /// In en, this message translates to:
  /// **'We currently don’t deliver to this location. Try a nearby location or choose from your saved addresses.'**
  String get mapOutsideMessage;

  /// No description provided for @mapPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Map preview. Drag to move the pin.'**
  String get mapPlaceholder;

  /// No description provided for @addressFormNewTitle.
  ///
  /// In en, this message translates to:
  /// **'Complete Your Address'**
  String get addressFormNewTitle;

  /// No description provided for @addressFormEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Your Address'**
  String get addressFormEditTitle;

  /// No description provided for @addressFormChange.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get addressFormChange;

  /// No description provided for @addressFormPhotosTitle.
  ///
  /// In en, this message translates to:
  /// **'Help drivers Find You Faster!'**
  String get addressFormPhotosTitle;

  /// No description provided for @addressFormPhotosMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a photo to auto-fill your address.'**
  String get addressFormPhotosMessage;

  /// No description provided for @addressFormBluePlate.
  ///
  /// In en, this message translates to:
  /// **'Blue Board Photo'**
  String get addressFormBluePlate;

  /// No description provided for @addressFormBuildingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Building photo'**
  String get addressFormBuildingPhoto;

  /// No description provided for @addressFormRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get addressFormRemovePhoto;

  /// No description provided for @addressFormUploadTitle.
  ///
  /// In en, this message translates to:
  /// **'Upload an Image'**
  String get addressFormUploadTitle;

  /// No description provided for @addressFormCapture.
  ///
  /// In en, this message translates to:
  /// **'Capture'**
  String get addressFormCapture;

  /// No description provided for @addressFormGallery.
  ///
  /// In en, this message translates to:
  /// **'Upload from Gallery'**
  String get addressFormGallery;

  /// No description provided for @addressFormZone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get addressFormZone;

  /// No description provided for @addressFormStreet.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get addressFormStreet;

  /// No description provided for @addressFormBuilding.
  ///
  /// In en, this message translates to:
  /// **'Building Number'**
  String get addressFormBuilding;

  /// No description provided for @addressFormUnit.
  ///
  /// In en, this message translates to:
  /// **'Flat / Unit Number'**
  String get addressFormUnit;

  /// No description provided for @addressFormType.
  ///
  /// In en, this message translates to:
  /// **'Location Type'**
  String get addressFormType;

  /// No description provided for @addressFormOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get addressFormOther;

  /// No description provided for @addressFormDirections.
  ///
  /// In en, this message translates to:
  /// **'How to Reach (Optional)'**
  String get addressFormDirections;

  /// No description provided for @addressFormDirectionsHint.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get addressFormDirectionsHint;

  /// No description provided for @addressFormDefault.
  ///
  /// In en, this message translates to:
  /// **'Set this address as default'**
  String get addressFormDefault;

  /// No description provided for @addressTypeHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get addressTypeHome;

  /// No description provided for @addressTypeWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get addressTypeWork;

  /// No description provided for @addressTypeFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get addressTypeFamily;

  /// No description provided for @addressTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get addressTypeOther;

  /// No description provided for @addressTypeMosque.
  ///
  /// In en, this message translates to:
  /// **'Mosque'**
  String get addressTypeMosque;

  /// No description provided for @favouritesTitle.
  ///
  /// In en, this message translates to:
  /// **'My Favourite'**
  String get favouritesTitle;

  /// No description provided for @favouritesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We know you love it!'**
  String get favouritesSubtitle;

  /// No description provided for @favouritesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No favourites yet'**
  String get favouritesEmptyTitle;

  /// No description provided for @favouritesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Love something? Add it to your favourites for easy access later.'**
  String get favouritesEmptyMessage;

  /// No description provided for @favouritesGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'Sign up or log in to wishlist items and access them later.'**
  String get favouritesGuestMessage;

  /// No description provided for @favouritesViewProducts.
  ///
  /// In en, this message translates to:
  /// **'View Products'**
  String get favouritesViewProducts;

  /// No description provided for @checkoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkoutTitle;

  /// No description provided for @checkoutEdit.
  ///
  /// In en, this message translates to:
  /// **'EDIT'**
  String get checkoutEdit;

  /// No description provided for @checkoutChange.
  ///
  /// In en, this message translates to:
  /// **'CHANGE'**
  String get checkoutChange;

  /// No description provided for @checkoutDeliveryMode.
  ///
  /// In en, this message translates to:
  /// **'Delivery Mode'**
  String get checkoutDeliveryMode;

  /// No description provided for @checkoutRepeatHint.
  ///
  /// In en, this message translates to:
  /// **'Select Repeat Date & Time of Delivery'**
  String get checkoutRepeatHint;

  /// No description provided for @checkoutDeliverHere.
  ///
  /// In en, this message translates to:
  /// **'We’ll deliver your order here'**
  String get checkoutDeliverHere;

  /// No description provided for @checkoutNoAddress.
  ///
  /// In en, this message translates to:
  /// **'Add an address to deliver to'**
  String get checkoutNoAddress;

  /// No description provided for @checkoutAwayNotice.
  ///
  /// In en, this message translates to:
  /// **'You\'re away from the selected location. Tap change to order from your current location.'**
  String get checkoutAwayNotice;

  /// No description provided for @checkoutOutsideQatarNotice.
  ///
  /// In en, this message translates to:
  /// **'You\'re outside Qatar. Tap Change Location to order. Only card payments are available (COD disabled).'**
  String get checkoutOutsideQatarNotice;

  /// No description provided for @checkoutInstruction.
  ///
  /// In en, this message translates to:
  /// **'Special Instruction (Optional)'**
  String get checkoutInstruction;

  /// No description provided for @checkoutInstructionHint.
  ///
  /// In en, this message translates to:
  /// **'Add special instructions'**
  String get checkoutInstructionHint;

  /// No description provided for @checkoutAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get checkoutAdd;

  /// No description provided for @checkoutEditInstruction.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get checkoutEditInstruction;

  /// No description provided for @checkoutBillSummary.
  ///
  /// In en, this message translates to:
  /// **'Bill Summary'**
  String get checkoutBillSummary;

  /// No description provided for @checkoutBillLine.
  ///
  /// In en, this message translates to:
  /// **'{name} ({volume} ML x {pack}) x{qty}'**
  String checkoutBillLine(String name, int volume, int pack, int qty);

  /// No description provided for @checkoutRepeatBillNote.
  ///
  /// In en, this message translates to:
  /// **'Pay for your recent delivery now. Future payment reminders will appear on My Orders and Home'**
  String get checkoutRepeatBillNote;

  /// No description provided for @checkoutShowBill.
  ///
  /// In en, this message translates to:
  /// **'Show bill details'**
  String get checkoutShowBill;

  /// No description provided for @checkoutHideBill.
  ///
  /// In en, this message translates to:
  /// **'Hide bill details'**
  String get checkoutHideBill;

  /// No description provided for @checkoutPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get checkoutPaymentMethod;

  /// No description provided for @checkoutPayByCard.
  ///
  /// In en, this message translates to:
  /// **'Pay by Card'**
  String get checkoutPayByCard;

  /// No description provided for @checkoutSavedCards.
  ///
  /// In en, this message translates to:
  /// **'Saved Cards'**
  String get checkoutSavedCards;

  /// No description provided for @checkoutCardMasked.
  ///
  /// In en, this message translates to:
  /// **'{brand} •••• •••• •••• {last4}'**
  String checkoutCardMasked(String brand, String last4);

  /// No description provided for @checkoutCardExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires {expiry}'**
  String checkoutCardExpires(String expiry);

  /// No description provided for @checkoutBrandVisa.
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get checkoutBrandVisa;

  /// No description provided for @checkoutBrandMastercard.
  ///
  /// In en, this message translates to:
  /// **'Mastercard'**
  String get checkoutBrandMastercard;

  /// No description provided for @checkoutBrandAmex.
  ///
  /// In en, this message translates to:
  /// **'Amex'**
  String get checkoutBrandAmex;

  /// No description provided for @checkoutBrandOther.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get checkoutBrandOther;

  /// No description provided for @checkoutCvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get checkoutCvv;

  /// No description provided for @checkoutAddNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add New Card'**
  String get checkoutAddNewCard;

  /// No description provided for @checkoutPayByQPay.
  ///
  /// In en, this message translates to:
  /// **'Pay by QPay'**
  String get checkoutPayByQPay;

  /// No description provided for @checkoutQPaySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay with your QPay debit card'**
  String get checkoutQPaySubtitle;

  /// No description provided for @checkoutPayByCash.
  ///
  /// In en, this message translates to:
  /// **'Pay by Cash'**
  String get checkoutPayByCash;

  /// No description provided for @checkoutCashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pay cash directly to driver'**
  String get checkoutCashSubtitle;

  /// No description provided for @checkoutTaxNote.
  ///
  /// In en, this message translates to:
  /// **'Prices are inclusive of Taxes'**
  String get checkoutTaxNote;

  /// No description provided for @checkoutPlaceOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get checkoutPlaceOrder;

  /// No description provided for @checkoutToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get checkoutToday;

  /// No description provided for @checkoutTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get checkoutTomorrow;

  /// No description provided for @checkoutAnotherDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Another Date'**
  String get checkoutAnotherDate;

  /// No description provided for @checkoutWhenToday.
  ///
  /// In en, this message translates to:
  /// **'Today, {slot}'**
  String checkoutWhenToday(String slot);

  /// No description provided for @checkoutWhenTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow, {slot}'**
  String checkoutWhenTomorrow(String slot);

  /// No description provided for @checkoutWhenDate.
  ///
  /// In en, this message translates to:
  /// **'{date} | {slot}'**
  String checkoutWhenDate(String date, String slot);

  /// No description provided for @checkoutWhenDay.
  ///
  /// In en, this message translates to:
  /// **'{date}, {slot}'**
  String checkoutWhenDay(String date, String slot);

  /// No description provided for @checkoutSlotSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Date & Time For Delivery'**
  String get checkoutSlotSheetTitle;

  /// No description provided for @checkoutDate.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get checkoutDate;

  /// No description provided for @checkoutTimeSlot.
  ///
  /// In en, this message translates to:
  /// **'Time Slot'**
  String get checkoutTimeSlot;

  /// No description provided for @checkoutEstimated.
  ///
  /// In en, this message translates to:
  /// **'Estimated delivery schedule'**
  String get checkoutEstimated;

  /// No description provided for @checkoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get checkoutConfirm;

  /// No description provided for @checkoutChangeDate.
  ///
  /// In en, this message translates to:
  /// **'Change date'**
  String get checkoutChangeDate;

  /// No description provided for @checkoutPrevMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous month'**
  String get checkoutPrevMonth;

  /// No description provided for @checkoutNextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next month'**
  String get checkoutNextMonth;

  /// No description provided for @checkoutFrequency.
  ///
  /// In en, this message translates to:
  /// **'Frequency'**
  String get checkoutFrequency;

  /// No description provided for @checkoutWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get checkoutWeekly;

  /// No description provided for @checkoutMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get checkoutMonthly;

  /// No description provided for @checkoutUntilCancel.
  ///
  /// In en, this message translates to:
  /// **'Until I Cancel'**
  String get checkoutUntilCancel;

  /// No description provided for @checkoutInstructionSheetHint.
  ///
  /// In en, this message translates to:
  /// **'Type your special instruction...'**
  String get checkoutInstructionSheetHint;

  /// No description provided for @checkoutChipNoBell.
  ///
  /// In en, this message translates to:
  /// **'Don\'t ring the bell'**
  String get checkoutChipNoBell;

  /// No description provided for @checkoutChipDoor.
  ///
  /// In en, this message translates to:
  /// **'Deliver at the door'**
  String get checkoutChipDoor;

  /// No description provided for @checkoutChipHand.
  ///
  /// In en, this message translates to:
  /// **'Hand me the order'**
  String get checkoutChipHand;

  /// No description provided for @checkoutCounter.
  ///
  /// In en, this message translates to:
  /// **'{count}/{max}'**
  String checkoutCounter(String count, int max);

  /// No description provided for @checkoutCardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get checkoutCardNumber;

  /// No description provided for @checkoutCardNumberHint.
  ///
  /// In en, this message translates to:
  /// **'0000 0000 0000 0000'**
  String get checkoutCardNumberHint;

  /// No description provided for @checkoutCardHolder.
  ///
  /// In en, this message translates to:
  /// **'Card Holder Name'**
  String get checkoutCardHolder;

  /// No description provided for @checkoutExpiry.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get checkoutExpiry;

  /// No description provided for @checkoutExpiryHint.
  ///
  /// In en, this message translates to:
  /// **'MM/YY'**
  String get checkoutExpiryHint;

  /// No description provided for @checkoutSaveCard.
  ///
  /// In en, this message translates to:
  /// **'Save card for future payments'**
  String get checkoutSaveCard;

  /// No description provided for @paymentDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Payment Details'**
  String get paymentDetailsTitle;

  /// No description provided for @paymentHoldOn.
  ///
  /// In en, this message translates to:
  /// **'Hold On!'**
  String get paymentHoldOn;

  /// No description provided for @paymentVerifying.
  ///
  /// In en, this message translates to:
  /// **'We are verifying your payment status'**
  String get paymentVerifying;

  /// No description provided for @paymentNoteLabel.
  ///
  /// In en, this message translates to:
  /// **'Note:'**
  String get paymentNoteLabel;

  /// No description provided for @paymentNoteText.
  ///
  /// In en, this message translates to:
  /// **'Do not hit back button or close this screen until the transaction is complete'**
  String get paymentNoteText;

  /// No description provided for @paymentCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel the payment?'**
  String get paymentCancelTitle;

  /// No description provided for @paymentCancelMessage.
  ///
  /// In en, this message translates to:
  /// **'The payment request will get cancelled as we are confirming your payment status.'**
  String get paymentCancelMessage;

  /// No description provided for @paymentNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get paymentNotNow;

  /// No description provided for @paymentYesCancel.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get paymentYesCancel;

  /// No description provided for @paymentFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your payment failed'**
  String get paymentFailedTitle;

  /// No description provided for @paymentChangeMethod.
  ///
  /// In en, this message translates to:
  /// **'Change Payment Method'**
  String get paymentChangeMethod;

  /// No description provided for @receiptItems.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get receiptItems;

  /// No description provided for @receiptQty.
  ///
  /// In en, this message translates to:
  /// **'{size} | Qty {qty}'**
  String receiptQty(String size, String qty);

  /// No description provided for @orderPlacedTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Placed'**
  String get orderPlacedTitle;

  /// No description provided for @orderPlacedThanks.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your purchase!'**
  String get orderPlacedThanks;

  /// No description provided for @receiptSpecialInstruction.
  ///
  /// In en, this message translates to:
  /// **'Special Instruction'**
  String get receiptSpecialInstruction;

  /// No description provided for @receiptPaymentMode.
  ///
  /// In en, this message translates to:
  /// **'Payment Mode'**
  String get receiptPaymentMode;

  /// No description provided for @receiptDeliveryDateTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Date & Time'**
  String get receiptDeliveryDateTime;

  /// No description provided for @profileEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileEditTitle;

  /// No description provided for @commonNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get commonNotNow;

  /// No description provided for @commonGoBack.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get commonGoBack;

  /// No description provided for @languageNativeEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageNativeEnglish;

  /// No description provided for @languageNativeArabic.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get languageNativeArabic;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTitle;

  /// No description provided for @profileGuestTitle.
  ///
  /// In en, this message translates to:
  /// **'Guest User'**
  String get profileGuestTitle;

  /// No description provided for @profileGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'Login or sign up to view your complete profile'**
  String get profileGuestMessage;

  /// No description provided for @profileLoginSignUp.
  ///
  /// In en, this message translates to:
  /// **'Login/Sign Up'**
  String get profileLoginSignUp;

  /// No description provided for @profileChangeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get profileChangeLanguage;

  /// No description provided for @profileLanguageShortEn.
  ///
  /// In en, this message translates to:
  /// **'Eng'**
  String get profileLanguageShortEn;

  /// No description provided for @profileLanguageShortAr.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get profileLanguageShortAr;

  /// No description provided for @profilePointsLabel.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get profilePointsLabel;

  /// No description provided for @profilePointsWorth.
  ///
  /// In en, this message translates to:
  /// **'Worth {amount}'**
  String profilePointsWorth(String amount);

  /// No description provided for @profilePointsExpiring.
  ///
  /// In en, this message translates to:
  /// **'{points} pts about expire in {days} days'**
  String profilePointsExpiring(String points, int days);

  /// No description provided for @profileOpenRewards.
  ///
  /// In en, this message translates to:
  /// **'Open rewards'**
  String get profileOpenRewards;

  /// No description provided for @profileMyProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get profileMyProfile;

  /// No description provided for @profileMyOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get profileMyOrders;

  /// No description provided for @profileSavedAddress.
  ///
  /// In en, this message translates to:
  /// **'Saved Address'**
  String get profileSavedAddress;

  /// No description provided for @profileSavedCards.
  ///
  /// In en, this message translates to:
  /// **'Saved Cards'**
  String get profileSavedCards;

  /// No description provided for @profileRewardsOffers.
  ///
  /// In en, this message translates to:
  /// **'Rewards & Offers'**
  String get profileRewardsOffers;

  /// No description provided for @profileHowToEarn.
  ///
  /// In en, this message translates to:
  /// **'How to Earn & Redeem'**
  String get profileHowToEarn;

  /// No description provided for @profileOffers.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get profileOffers;

  /// No description provided for @profileSupportMore.
  ///
  /// In en, this message translates to:
  /// **'Support & More'**
  String get profileSupportMore;

  /// No description provided for @profileWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Support'**
  String get profileWhatsApp;

  /// No description provided for @profileTermsPolicies.
  ///
  /// In en, this message translates to:
  /// **'Terms & Policies'**
  String get profileTermsPolicies;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @profileChangeLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get profileChangeLanguageTitle;

  /// No description provided for @profileLogoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get profileLogoutTitle;

  /// No description provided for @profileLogoutMessage.
  ///
  /// In en, this message translates to:
  /// **'You won\'t be able to access your cart and saved items until you log back in.'**
  String get profileLogoutMessage;

  /// No description provided for @profileWhatsAppUnavailableTitle.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp is not available'**
  String get profileWhatsAppUnavailableTitle;

  /// No description provided for @profileWhatsAppUnavailableMessage.
  ///
  /// In en, this message translates to:
  /// **'Install WhatsApp or try again later.'**
  String get profileWhatsAppUnavailableMessage;

  /// No description provided for @commonOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get commonOk;

  /// No description provided for @profileChangeMobile.
  ///
  /// In en, this message translates to:
  /// **'Change mobile number'**
  String get profileChangeMobile;

  /// No description provided for @profileChangeEmail.
  ///
  /// In en, this message translates to:
  /// **'Change email'**
  String get profileChangeEmail;

  /// No description provided for @profileChangeMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to change mobile number?'**
  String get profileChangeMobileTitle;

  /// No description provided for @profileChangeMobileMessage.
  ///
  /// In en, this message translates to:
  /// **'To change your mobile number, you\'ll first need to verify your existing number.'**
  String get profileChangeMobileMessage;

  /// No description provided for @profileYesChange.
  ///
  /// In en, this message translates to:
  /// **'Yes, Change'**
  String get profileYesChange;

  /// No description provided for @profileVerifyEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Email'**
  String get profileVerifyEmailTitle;

  /// No description provided for @profileNewMobileTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter New Mobile Number'**
  String get profileNewMobileTitle;

  /// No description provided for @profileNewMobileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the mobile number you\'d like to use for your account.'**
  String get profileNewMobileSubtitle;

  /// No description provided for @profileNewEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter New Email'**
  String get profileNewEmailTitle;

  /// No description provided for @profileNewEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the email you\'d like to use for your account.'**
  String get profileNewEmailSubtitle;

  /// No description provided for @profileNumberTaken.
  ///
  /// In en, this message translates to:
  /// **'This number already exist'**
  String get profileNumberTaken;

  /// No description provided for @profileEmailTaken.
  ///
  /// In en, this message translates to:
  /// **'This email already exists'**
  String get profileEmailTaken;

  /// No description provided for @savedAddressesTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddressesTitle;

  /// No description provided for @savedAddressesEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved addresses'**
  String get savedAddressesEmptyTitle;

  /// No description provided for @savedAddressesEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add an address to make checkout faster and easier next time.'**
  String get savedAddressesEmptyMessage;

  /// No description provided for @savedAddressesDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address?'**
  String get savedAddressesDeleteTitle;

  /// No description provided for @savedCardsTitle.
  ///
  /// In en, this message translates to:
  /// **'Saved Cards'**
  String get savedCardsTitle;

  /// No description provided for @savedCardsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No saved cards'**
  String get savedCardsEmptyTitle;

  /// No description provided for @savedCardsGuestMessage.
  ///
  /// In en, this message translates to:
  /// **'log in to save your cards and use them for faster checkout.'**
  String get savedCardsGuestMessage;

  /// No description provided for @savedCardsEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Add a card to make checkout faster and easier next time.'**
  String get savedCardsEmptyMessage;

  /// No description provided for @savedCardsEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Card'**
  String get savedCardsEditTitle;

  /// No description provided for @savedCardsDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this card?'**
  String get savedCardsDeleteTitle;

  /// No description provided for @savedCardsMore.
  ///
  /// In en, this message translates to:
  /// **'More options for {card}'**
  String savedCardsMore(String card);

  /// No description provided for @offersTitle.
  ///
  /// In en, this message translates to:
  /// **'Offers'**
  String get offersTitle;

  /// No description provided for @offersAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available Coupons'**
  String get offersAvailable;

  /// No description provided for @offersCopyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy Code'**
  String get offersCopyCode;

  /// No description provided for @offersTermsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get offersTermsTitle;

  /// No description provided for @offersUnderstood.
  ///
  /// In en, this message translates to:
  /// **'Understood'**
  String get offersUnderstood;

  /// No description provided for @policiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms & Policies'**
  String get policiesTitle;

  /// No description provided for @policyAboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get policyAboutUs;

  /// No description provided for @policyTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get policyTerms;

  /// No description provided for @policyPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get policyPrivacy;

  /// No description provided for @policyRefund.
  ///
  /// In en, this message translates to:
  /// **'Return & Refund Policy'**
  String get policyRefund;

  /// No description provided for @policyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated {date}'**
  String policyLastUpdated(String date);

  /// No description provided for @deleteAccountLink.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountLink;

  /// No description provided for @deleteAccountConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get deleteAccountConfirmTitle;

  /// No description provided for @deleteAccountConfirmMessage.
  ///
  /// In en, this message translates to:
  /// **'Deleting account is permanent and all your data with Rayyan Waters will be permanently removed.'**
  String get deleteAccountConfirmMessage;

  /// No description provided for @deleteAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccountTitle;

  /// No description provided for @deleteAccountIntro.
  ///
  /// In en, this message translates to:
  /// **'Please help us serve you better in future, Thanks.'**
  String get deleteAccountIntro;

  /// No description provided for @deleteAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'What Do We Need To Improve?'**
  String get deleteAccountQuestion;

  /// No description provided for @deleteReasonPerformance.
  ///
  /// In en, this message translates to:
  /// **'App\'s Performance'**
  String get deleteReasonPerformance;

  /// No description provided for @deleteReasonPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy concerns'**
  String get deleteReasonPrivacy;

  /// No description provided for @deleteReasonProducts.
  ///
  /// In en, this message translates to:
  /// **'Product offerings'**
  String get deleteReasonProducts;

  /// No description provided for @deleteReasonService.
  ///
  /// In en, this message translates to:
  /// **'Service concerns'**
  String get deleteReasonService;

  /// No description provided for @deleteReasonMultiple.
  ///
  /// In en, this message translates to:
  /// **'Multiple accounts'**
  String get deleteReasonMultiple;

  /// No description provided for @deleteReasonOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get deleteReasonOthers;

  /// No description provided for @deleteAccountSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip & Delete'**
  String get deleteAccountSkip;

  /// No description provided for @deleteAccountProceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get deleteAccountProceed;

  /// No description provided for @deletedTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Account Is Scheduled for Deletion'**
  String get deletedTitle;

  /// No description provided for @deletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Changed your mind? Log in within 30 days to recover your account.'**
  String get deletedMessage;

  /// No description provided for @deletedGoLogin.
  ///
  /// In en, this message translates to:
  /// **'Go to Login'**
  String get deletedGoLogin;

  /// No description provided for @deletedContinueGuest.
  ///
  /// In en, this message translates to:
  /// **'Continue As Guest'**
  String get deletedContinueGuest;

  /// No description provided for @ordersTitle.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get ordersTitle;

  /// No description provided for @ordersTabOneTime.
  ///
  /// In en, this message translates to:
  /// **'One Time'**
  String get ordersTabOneTime;

  /// No description provided for @ordersTabRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring'**
  String get ordersTabRecurring;

  /// No description provided for @ordersFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get ordersFilterAll;

  /// No description provided for @ordersFilterDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get ordersFilterDelivered;

  /// No description provided for @ordersFilterPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Picked Up'**
  String get ordersFilterPickedUp;

  /// No description provided for @ordersFilterConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get ordersFilterConfirmed;

  /// No description provided for @ordersFilterFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get ordersFilterFailed;

  /// No description provided for @ordersFilterCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get ordersFilterCancelled;

  /// No description provided for @orderStatusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed'**
  String get orderStatusConfirmed;

  /// No description provided for @orderStatusPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Order Picked Up'**
  String get orderStatusPickedUp;

  /// No description provided for @orderStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get orderStatusDelivered;

  /// No description provided for @orderStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Delivery Failed'**
  String get orderStatusFailed;

  /// No description provided for @orderStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get orderStatusCancelled;

  /// No description provided for @ordersTagPaid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get ordersTagPaid;

  /// No description provided for @ordersTagCod.
  ///
  /// In en, this message translates to:
  /// **'COD'**
  String get ordersTagCod;

  /// No description provided for @ordersItemCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Item} other{{count} Items}}'**
  String ordersItemCount(int count);

  /// No description provided for @ordersItemQty.
  ///
  /// In en, this message translates to:
  /// **'{name} (Qty {qty})'**
  String ordersItemQty(String name, int qty);

  /// No description provided for @ordersOpen.
  ///
  /// In en, this message translates to:
  /// **'View details, {status}'**
  String ordersOpen(String status);

  /// No description provided for @ordersEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No Orders'**
  String get ordersEmptyTitle;

  /// No description provided for @ordersEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Orders assigned to you will show here.'**
  String get ordersEmptyMessage;

  /// No description provided for @ordersFilterEmpty.
  ///
  /// In en, this message translates to:
  /// **'No orders with this status.'**
  String get ordersFilterEmpty;

  /// No description provided for @ordersRecurringEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No recurring orders'**
  String get ordersRecurringEmptyTitle;

  /// No description provided for @ordersRecurringEmptyMessage.
  ///
  /// In en, this message translates to:
  /// **'Choose Repeat Order at checkout to get water delivered on a schedule.'**
  String get ordersRecurringEmptyMessage;

  /// No description provided for @ordersNextDelivery.
  ///
  /// In en, this message translates to:
  /// **'Next Delivery'**
  String get ordersNextDelivery;

  /// No description provided for @subscriptionProgress.
  ///
  /// In en, this message translates to:
  /// **'{delivered}/{total} Delivered'**
  String subscriptionProgress(int delivered, int total);

  /// No description provided for @subscriptionOpenEnded.
  ///
  /// In en, this message translates to:
  /// **'{delivered} Delivered (until Cancelled)'**
  String subscriptionOpenEnded(int delivered);

  /// No description provided for @subscriptionCancelledProgress.
  ///
  /// In en, this message translates to:
  /// **'Cancelled • {progress}'**
  String subscriptionCancelledProgress(String progress);

  /// No description provided for @subscriptionPausedProgress.
  ///
  /// In en, this message translates to:
  /// **'Paused • {progress}'**
  String subscriptionPausedProgress(String progress);

  /// No description provided for @orderTimeStamp.
  ///
  /// In en, this message translates to:
  /// **'{date} | {time}'**
  String orderTimeStamp(String date, String time);

  /// No description provided for @orderTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Order Type'**
  String get orderTypeLabel;

  /// No description provided for @orderTypeRecurring.
  ///
  /// In en, this message translates to:
  /// **'Recurring Delivery'**
  String get orderTypeRecurring;

  /// No description provided for @orderItems.
  ///
  /// In en, this message translates to:
  /// **'Items ({count})'**
  String orderItems(int count);

  /// No description provided for @orderDriverDetails.
  ///
  /// In en, this message translates to:
  /// **'Driver Details'**
  String get orderDriverDetails;

  /// No description provided for @orderCallDriver.
  ///
  /// In en, this message translates to:
  /// **'Call the driver'**
  String get orderCallDriver;

  /// No description provided for @orderPayAtDelivery.
  ///
  /// In en, this message translates to:
  /// **'Pay at the time of delivery'**
  String get orderPayAtDelivery;

  /// No description provided for @orderPayWithPoints.
  ///
  /// In en, this message translates to:
  /// **'{method} + Points'**
  String orderPayWithPoints(String method);

  /// No description provided for @orderPointsRedeemed.
  ///
  /// In en, this message translates to:
  /// **'Points Redeemed'**
  String get orderPointsRedeemed;

  /// No description provided for @orderPointsEarned.
  ///
  /// In en, this message translates to:
  /// **'Points Earned'**
  String get orderPointsEarned;

  /// No description provided for @orderPointsRevoked.
  ///
  /// In en, this message translates to:
  /// **'Points Revoked'**
  String get orderPointsRevoked;

  /// No description provided for @orderPointsPlus.
  ///
  /// In en, this message translates to:
  /// **'+ {amount}'**
  String orderPointsPlus(String amount);

  /// No description provided for @orderPointsMinus.
  ///
  /// In en, this message translates to:
  /// **'- {amount}'**
  String orderPointsMinus(String amount);

  /// No description provided for @orderPointsPendingNote.
  ///
  /// In en, this message translates to:
  /// **'Reward points will be credited after delivery'**
  String get orderPointsPendingNote;

  /// No description provided for @orderPointsCancelledNote.
  ///
  /// In en, this message translates to:
  /// **'{points} points reversed due to cancellation'**
  String orderPointsCancelledNote(String points);

  /// No description provided for @orderPointsFailedNote.
  ///
  /// In en, this message translates to:
  /// **'{points} points reversed as the order failed'**
  String orderPointsFailedNote(String points);

  /// No description provided for @orderFailedNotice.
  ///
  /// In en, this message translates to:
  /// **'Payment failed. If any amount was deducted, it will be automatically refunded to your original payment method.'**
  String get orderFailedNotice;

  /// No description provided for @orderCancelledNotice.
  ///
  /// In en, this message translates to:
  /// **'Your order has been cancelled. We will reach out to you regarding your refund.'**
  String get orderCancelledNotice;

  /// No description provided for @orderCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get orderCancel;

  /// No description provided for @orderDownloadInvoice.
  ///
  /// In en, this message translates to:
  /// **'Download Invoice'**
  String get orderDownloadInvoice;

  /// No description provided for @orderPayForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Pay For Delivery'**
  String get orderPayForDelivery;

  /// No description provided for @orderCancelTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to cancel this order?'**
  String get orderCancelTitle;

  /// No description provided for @orderCancelMessage.
  ///
  /// In en, this message translates to:
  /// **'Once cancelled, this order cannot be restored. Are you sure you want to continue?'**
  String get orderCancelMessage;

  /// No description provided for @orderCancelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Yes, Cancel'**
  String get orderCancelConfirm;

  /// No description provided for @orderLinkFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t open it. Please try again.'**
  String get orderLinkFailed;

  /// No description provided for @subscriptionStatusScheduled.
  ///
  /// In en, this message translates to:
  /// **'Order Scheduled'**
  String get subscriptionStatusScheduled;

  /// No description provided for @subscriptionStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Order Completed'**
  String get subscriptionStatusCompleted;

  /// No description provided for @subscriptionStatusPaused.
  ///
  /// In en, this message translates to:
  /// **'Order Paused'**
  String get subscriptionStatusPaused;

  /// No description provided for @subscriptionPausedNotice.
  ///
  /// In en, this message translates to:
  /// **'Your order is paused. To continue delivery, you need to resume it.'**
  String get subscriptionPausedNotice;

  /// No description provided for @subscriptionPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get subscriptionPause;

  /// No description provided for @subscriptionResume.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get subscriptionResume;

  /// No description provided for @deliveryStatusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get deliveryStatusDelivered;

  /// No description provided for @deliveryStatusPickedUp.
  ///
  /// In en, this message translates to:
  /// **'Order Picked Up'**
  String get deliveryStatusPickedUp;

  /// No description provided for @deliveryStatusYetToDeliver.
  ///
  /// In en, this message translates to:
  /// **'Yet To deliver'**
  String get deliveryStatusYetToDeliver;

  /// No description provided for @deliveryStatusPaused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get deliveryStatusPaused;

  /// No description provided for @deliveryStatusCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get deliveryStatusCancelled;

  /// No description provided for @deliveryNumbered.
  ///
  /// In en, this message translates to:
  /// **'{number}/{total} {status}'**
  String deliveryNumbered(int number, int total, String status);

  /// No description provided for @deliveryTaxNote.
  ///
  /// In en, this message translates to:
  /// **'Prices are inclusive of Taxes'**
  String get deliveryTaxNote;

  /// No description provided for @deliveryPayNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get deliveryPayNow;

  /// No description provided for @cancelSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Subscription'**
  String get cancelSubTitle;

  /// No description provided for @cancelReasonTooExpensive.
  ///
  /// In en, this message translates to:
  /// **'Too expensive'**
  String get cancelReasonTooExpensive;

  /// No description provided for @cancelReasonDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery issues'**
  String get cancelReasonDelivery;

  /// No description provided for @cancelReasonSwitching.
  ///
  /// In en, this message translates to:
  /// **'Switching to another provider'**
  String get cancelReasonSwitching;

  /// No description provided for @cancelReasonPausing.
  ///
  /// In en, this message translates to:
  /// **'Pausing temporarily'**
  String get cancelReasonPausing;

  /// No description provided for @cancelReasonQuality.
  ///
  /// In en, this message translates to:
  /// **'Product quality'**
  String get cancelReasonQuality;

  /// No description provided for @cancelSubWarning.
  ///
  /// In en, this message translates to:
  /// **'This can\'t be undone. Any remaining deliveries are removed.'**
  String get cancelSubWarning;

  /// No description provided for @cancelSubPausedNotice.
  ///
  /// In en, this message translates to:
  /// **'Cancelling a paused subscription removes the remaining deliveries and closes it for good.'**
  String get cancelSubPausedNotice;

  /// No description provided for @cancelSubConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Cancellation'**
  String get cancelSubConfirm;

  /// No description provided for @refundSummary.
  ///
  /// In en, this message translates to:
  /// **'Refund Summary'**
  String get refundSummary;

  /// No description provided for @refundRemaining.
  ///
  /// In en, this message translates to:
  /// **'Deliveries remaining'**
  String get refundRemaining;

  /// No description provided for @refundRemainingValue.
  ///
  /// In en, this message translates to:
  /// **'{remaining}/{total}'**
  String refundRemainingValue(int remaining, int total);

  /// No description provided for @refundUnused.
  ///
  /// In en, this message translates to:
  /// **'Value of unused deliveries'**
  String get refundUnused;

  /// No description provided for @refundDeductions.
  ///
  /// In en, this message translates to:
  /// **'Deductions (policy)'**
  String get refundDeductions;

  /// No description provided for @refundDue.
  ///
  /// In en, this message translates to:
  /// **'Refund due'**
  String get refundDue;

  /// No description provided for @refundCodNote.
  ///
  /// In en, this message translates to:
  /// **'For COD subscriptions there is nothing to refund — future deliveries were never charged.'**
  String get refundCodNote;

  /// No description provided for @refundConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm & refund'**
  String get refundConfirm;

  /// No description provided for @cancelledTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Subscription Has been Cancelled'**
  String get cancelledTitle;

  /// No description provided for @cancelledMessage.
  ///
  /// In en, this message translates to:
  /// **'{name} has been cancelled.'**
  String cancelledMessage(String name);

  /// No description provided for @cancelledOn.
  ///
  /// In en, this message translates to:
  /// **'Cancelled On'**
  String get cancelledOn;

  /// No description provided for @cancelledRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get cancelledRefund;

  /// No description provided for @cancelledGoHome.
  ///
  /// In en, this message translates to:
  /// **'Go To Home'**
  String get cancelledGoHome;

  /// No description provided for @cancelledOrderDetail.
  ///
  /// In en, this message translates to:
  /// **'Order Detail'**
  String get cancelledOrderDetail;

  /// No description provided for @pauseType.
  ///
  /// In en, this message translates to:
  /// **'Pause Type'**
  String get pauseType;

  /// No description provided for @pauseForDeliveries.
  ///
  /// In en, this message translates to:
  /// **'Pause for number of deliveries'**
  String get pauseForDeliveries;

  /// No description provided for @pauseDaysSkipped.
  ///
  /// In en, this message translates to:
  /// **'Days skipped'**
  String get pauseDaysSkipped;

  /// No description provided for @pauseNextDelivery.
  ///
  /// In en, this message translates to:
  /// **'Next delivery'**
  String get pauseNextDelivery;

  /// No description provided for @pauseNothingLeft.
  ///
  /// In en, this message translates to:
  /// **'There are no deliveries left to pause.'**
  String get pauseNothingLeft;

  /// No description provided for @pauseFewer.
  ///
  /// In en, this message translates to:
  /// **'Fewer deliveries'**
  String get pauseFewer;

  /// No description provided for @pauseMore.
  ///
  /// In en, this message translates to:
  /// **'More deliveries'**
  String get pauseMore;

  /// No description provided for @pauseSubmit.
  ///
  /// In en, this message translates to:
  /// **'Pause subscription'**
  String get pauseSubmit;

  /// No description provided for @loyaltyTitle.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Points'**
  String get loyaltyTitle;

  /// No description provided for @loyaltyHowTo.
  ///
  /// In en, this message translates to:
  /// **'How to earn and redeem'**
  String get loyaltyHowTo;

  /// No description provided for @loyaltyTotalAvailable.
  ///
  /// In en, this message translates to:
  /// **'Total Available Points'**
  String get loyaltyTotalAvailable;

  /// No description provided for @loyaltyRate.
  ///
  /// In en, this message translates to:
  /// **'1pt = {amount}'**
  String loyaltyRate(String amount);

  /// No description provided for @loyaltyPending.
  ///
  /// In en, this message translates to:
  /// **'+{points} Pending Points'**
  String loyaltyPending(String points);

  /// No description provided for @loyaltyPendingNote.
  ///
  /// In en, this message translates to:
  /// **'Will be credited after delivery'**
  String get loyaltyPendingNote;

  /// No description provided for @loyaltyExpiringSoon.
  ///
  /// In en, this message translates to:
  /// **'Expiring Soon'**
  String get loyaltyExpiringSoon;

  /// No description provided for @loyaltyPointsExpiringIn.
  ///
  /// In en, this message translates to:
  /// **'points expiring in'**
  String get loyaltyPointsExpiringIn;

  /// No description provided for @loyaltyDaysLeft.
  ///
  /// In en, this message translates to:
  /// **'{days, plural, =1{1 Day} other{{days} Days}}'**
  String loyaltyDaysLeft(int days);

  /// No description provided for @loyaltyFifoNote.
  ///
  /// In en, this message translates to:
  /// **'Oldest points are used first (FIFO). Points expire {months} months after they\'re earned.'**
  String loyaltyFifoNote(int months);

  /// No description provided for @loyaltyHowToEarn.
  ///
  /// In en, this message translates to:
  /// **'How To Earn & Redeem'**
  String get loyaltyHowToEarn;

  /// No description provided for @loyaltyEarnLine.
  ///
  /// In en, this message translates to:
  /// **'Earn {points, plural, =1{1 Point} other{{points} Points}} for every QAR 1 Spent'**
  String loyaltyEarnLine(int points);

  /// No description provided for @loyaltyEarnNote.
  ///
  /// In en, this message translates to:
  /// **'Credited once your order is delivered'**
  String get loyaltyEarnNote;

  /// No description provided for @loyaltyRedeemLine.
  ///
  /// In en, this message translates to:
  /// **'{points} points = QAR 1 off your order'**
  String loyaltyRedeemLine(String points);

  /// No description provided for @loyaltyRedeemNote.
  ///
  /// In en, this message translates to:
  /// **'Min. {min} pts redemption, up to {percent}% of cart value'**
  String loyaltyRedeemNote(String min, int percent);

  /// No description provided for @loyaltyViewTerms.
  ///
  /// In en, this message translates to:
  /// **'View Full Terms'**
  String get loyaltyViewTerms;

  /// No description provided for @loyaltyHistory.
  ///
  /// In en, this message translates to:
  /// **'Transaction History'**
  String get loyaltyHistory;

  /// No description provided for @loyaltyFilterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get loyaltyFilterAll;

  /// No description provided for @loyaltyFilterEarned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get loyaltyFilterEarned;

  /// No description provided for @loyaltyFilterRedeemed.
  ///
  /// In en, this message translates to:
  /// **'Redeemed'**
  String get loyaltyFilterRedeemed;

  /// No description provided for @loyaltyFilterExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired'**
  String get loyaltyFilterExpired;

  /// No description provided for @loyaltyTxEarned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get loyaltyTxEarned;

  /// No description provided for @loyaltyTxRedeemed.
  ///
  /// In en, this message translates to:
  /// **'Redeemed'**
  String get loyaltyTxRedeemed;

  /// No description provided for @loyaltyTxExpired.
  ///
  /// In en, this message translates to:
  /// **'Expired ({months} months)'**
  String loyaltyTxExpired(int months);

  /// No description provided for @loyaltyTxRefund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get loyaltyTxRefund;

  /// No description provided for @loyaltyTxMeta.
  ///
  /// In en, this message translates to:
  /// **'{date} • {reference}'**
  String loyaltyTxMeta(String date, String reference);

  /// No description provided for @loyaltyHistoryEmpty.
  ///
  /// In en, this message translates to:
  /// **'No points activity yet.'**
  String get loyaltyHistoryEmpty;

  /// No description provided for @howTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Earn & Redeem'**
  String get howTitle;

  /// No description provided for @howSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Full transparency on your loyalty benefits'**
  String get howSubtitle;

  /// No description provided for @howEarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Earning Points'**
  String get howEarningTitle;

  /// No description provided for @howEarningTag.
  ///
  /// In en, this message translates to:
  /// **'1 QAR = {points, plural, =1{1 Point} other{{points} Points}}'**
  String howEarningTag(int points);

  /// No description provided for @howEarningBody.
  ///
  /// In en, this message translates to:
  /// **'Earn {points, plural, =1{1 point} other{{points} points}} for every QAR 1 spent on eligible purchases'**
  String howEarningBody(int points);

  /// No description provided for @howRedeemTitle.
  ///
  /// In en, this message translates to:
  /// **'Redeeming Points'**
  String get howRedeemTitle;

  /// No description provided for @howRedeemTag.
  ///
  /// In en, this message translates to:
  /// **'1 Point = {amount}'**
  String howRedeemTag(String amount);

  /// No description provided for @howRedeemBody.
  ///
  /// In en, this message translates to:
  /// **'Each point is worth {amount} when redeemed at checkout'**
  String howRedeemBody(String amount);

  /// No description provided for @howValidityTitle.
  ///
  /// In en, this message translates to:
  /// **'Points Validity'**
  String get howValidityTitle;

  /// No description provided for @howValidityTag.
  ///
  /// In en, this message translates to:
  /// **'Valid for {months} months'**
  String howValidityTag(int months);

  /// No description provided for @howValidityBody.
  ///
  /// In en, this message translates to:
  /// **'Points expire {months} months after earning. Oldest points are used first (FIFO)'**
  String howValidityBody(int months);

  /// No description provided for @howRulesTitle.
  ///
  /// In en, this message translates to:
  /// **'Redemption Rules'**
  String get howRulesTitle;

  /// No description provided for @howMinimumLabel.
  ///
  /// In en, this message translates to:
  /// **'Minimum'**
  String get howMinimumLabel;

  /// No description provided for @howMinimumValue.
  ///
  /// In en, this message translates to:
  /// **'{points} points'**
  String howMinimumValue(String points);

  /// No description provided for @howMaximumLabel.
  ///
  /// In en, this message translates to:
  /// **'Maximum'**
  String get howMaximumLabel;

  /// No description provided for @howMaximumValue.
  ///
  /// In en, this message translates to:
  /// **'{percent}% of cart'**
  String howMaximumValue(int percent);

  /// No description provided for @howMultiplesLabel.
  ///
  /// In en, this message translates to:
  /// **'Use points in multiples of'**
  String get howMultiplesLabel;

  /// No description provided for @howExampleTitle.
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get howExampleTitle;

  /// No description provided for @howExampleBody.
  ///
  /// In en, this message translates to:
  /// **'On a {order} order, your max redemption is {max} ({points} pts) — well above the {min}-point minimum, so you\'re free to redeem anywhere in between.'**
  String howExampleBody(String order, String max, String points, String min);

  /// No description provided for @howExclusions.
  ///
  /// In en, this message translates to:
  /// **'Exclusions'**
  String get howExclusions;

  /// No description provided for @howExDelivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery fees'**
  String get howExDelivery;

  /// No description provided for @howExDeliveryNote.
  ///
  /// In en, this message translates to:
  /// **'Excluded from points calculation'**
  String get howExDeliveryNote;

  /// No description provided for @howExCod.
  ///
  /// In en, this message translates to:
  /// **'Cash on Delivery (COD) fees'**
  String get howExCod;

  /// No description provided for @howExCodNote.
  ///
  /// In en, this message translates to:
  /// **'Can\'t be offset with points'**
  String get howExCodNote;

  /// No description provided for @howExDiscounted.
  ///
  /// In en, this message translates to:
  /// **'Already discounted items'**
  String get howExDiscounted;

  /// No description provided for @howExDiscountedNote.
  ///
  /// In en, this message translates to:
  /// **'Promotional SKUs don\'t earn or accept points'**
  String get howExDiscountedNote;

  /// No description provided for @howExGift.
  ///
  /// In en, this message translates to:
  /// **'Gift cards'**
  String get howExGift;

  /// No description provided for @howExGiftNote.
  ///
  /// In en, this message translates to:
  /// **'Excluded from loyalty benefits'**
  String get howExGiftNote;

  /// No description provided for @cartUsePoints.
  ///
  /// In en, this message translates to:
  /// **'Use Loyalty Points'**
  String get cartUsePoints;

  /// No description provided for @cartAvailablePoints.
  ///
  /// In en, this message translates to:
  /// **'Available Points'**
  String get cartAvailablePoints;

  /// No description provided for @cartPointsBalance.
  ///
  /// In en, this message translates to:
  /// **'{points} Pts'**
  String cartPointsBalance(String points);

  /// No description provided for @cartRedeemPoints.
  ///
  /// In en, this message translates to:
  /// **'Redeem points'**
  String get cartRedeemPoints;

  /// No description provided for @cartRedeemHint.
  ///
  /// In en, this message translates to:
  /// **'Use {points} points to Save {amount}'**
  String cartRedeemHint(String points, String amount);

  /// No description provided for @cartEnterPoints.
  ///
  /// In en, this message translates to:
  /// **'Enter points to redeem'**
  String get cartEnterPoints;

  /// No description provided for @cartPointsRange.
  ///
  /// In en, this message translates to:
  /// **'Min {min} Pts • Max {max} pts'**
  String cartPointsRange(String min, String max);

  /// No description provided for @cartPointsSuffix.
  ///
  /// In en, this message translates to:
  /// **'pts'**
  String get cartPointsSuffix;

  /// No description provided for @cartPointsInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a multiple of {step} from {min} to {max}.'**
  String cartPointsInvalid(String step, String min, String max);

  /// No description provided for @cartPointsPromo.
  ///
  /// In en, this message translates to:
  /// **'Points cannot be redeemed on promotional or discounted items in your cart.'**
  String get cartPointsPromo;

  /// No description provided for @cartPointsNotEnough.
  ///
  /// In en, this message translates to:
  /// **'You need at least {min} points to redeem rewards on this order.'**
  String cartPointsNotEnough(String min);

  /// No description provided for @cartPointsCartSmall.
  ///
  /// In en, this message translates to:
  /// **'Add more items to redeem points. At least {min} points are needed.'**
  String cartPointsCartSmall(String min);

  /// No description provided for @cartEarnNote.
  ///
  /// In en, this message translates to:
  /// **'Wow! Earn {points, plural, =1{1 Point} other{{points} Points}}, where 1 Point = {amount} in value'**
  String cartEarnNote(int points, String amount);

  /// No description provided for @orderPlacedOn.
  ///
  /// In en, this message translates to:
  /// **'Placed On'**
  String get orderPlacedOn;

  /// No description provided for @orderPaymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get orderPaymentStatus;

  /// No description provided for @ordersTagPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get ordersTagPending;

  /// No description provided for @orderTypeDeliverNow.
  ///
  /// In en, this message translates to:
  /// **'Deliver Now'**
  String get orderTypeDeliverNow;

  /// No description provided for @scheduleTitle.
  ///
  /// In en, this message translates to:
  /// **'Schedule Delivery'**
  String get scheduleTitle;

  /// No description provided for @scheduleDeliveryDays.
  ///
  /// In en, this message translates to:
  /// **'Delivery Days (Max {count} Days)'**
  String scheduleDeliveryDays(int count);

  /// No description provided for @scheduleDeliveryPeriod.
  ///
  /// In en, this message translates to:
  /// **'Delivery Period'**
  String get scheduleDeliveryPeriod;

  /// No description provided for @scheduleStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get scheduleStartDate;

  /// No description provided for @scheduleDeliverUntil.
  ///
  /// In en, this message translates to:
  /// **'Deliver Until'**
  String get scheduleDeliverUntil;

  /// No description provided for @scheduleSelect.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get scheduleSelect;

  /// No description provided for @schedulePerWeek.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Delivery a week} other{{count} Deliveries a week}}'**
  String schedulePerWeek(int count);

  /// No description provided for @schedulePerMonth.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Delivery a month} other{{count} Deliveries a month}}'**
  String schedulePerMonth(int count);

  /// No description provided for @scheduleWeekdayCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 {day}} other{{count} {day}s}}'**
  String scheduleWeekdayCount(int count, String day);

  /// No description provided for @scheduleDateCount.
  ///
  /// In en, this message translates to:
  /// **'{count} × {day}'**
  String scheduleDateCount(int count, String day);

  /// No description provided for @scheduleAnd.
  ///
  /// In en, this message translates to:
  /// **'{first} & {second}'**
  String scheduleAnd(String first, String second);

  /// No description provided for @scheduleSummary.
  ///
  /// In en, this message translates to:
  /// **'You will receive {count} deliveries, every {days} from {from} to {to}'**
  String scheduleSummary(String count, String days, String from, String to);

  /// No description provided for @scheduleSummaryOpen.
  ///
  /// In en, this message translates to:
  /// **'You will receive deliveries every {days} from {from} until you cancel'**
  String scheduleSummaryOpen(String days, String from);

  /// No description provided for @scheduleNoFeb.
  ///
  /// In en, this message translates to:
  /// **'Please note that month of February does not have days beyond 28'**
  String get scheduleNoFeb;

  /// No description provided for @scheduleNo31.
  ///
  /// In en, this message translates to:
  /// **'Please note that not all months have 31 days'**
  String get scheduleNo31;

  /// No description provided for @scheduleMonths.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Month} other{{count} Months}}'**
  String scheduleMonths(int count);

  /// No description provided for @scheduleCustomEnd.
  ///
  /// In en, this message translates to:
  /// **'Custom End Date'**
  String get scheduleCustomEnd;

  /// No description provided for @scheduleUntil.
  ///
  /// In en, this message translates to:
  /// **'Until {period}'**
  String scheduleUntil(String period);

  /// No description provided for @scheduleSlotTitle.
  ///
  /// In en, this message translates to:
  /// **'Delivery Slot'**
  String get scheduleSlotTitle;

  /// No description provided for @scheduleWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly, {days}'**
  String scheduleWeekly(String days);

  /// No description provided for @scheduleMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly, {days}'**
  String scheduleMonthly(String days);

  /// No description provided for @checkoutDeliverNow.
  ///
  /// In en, this message translates to:
  /// **'Deliver Now'**
  String get checkoutDeliverNow;

  /// No description provided for @checkoutDeliverNowHint.
  ///
  /// In en, this message translates to:
  /// **'Select Date & Time of Delivery'**
  String get checkoutDeliverNowHint;

  /// No description provided for @checkoutPaymentType.
  ///
  /// In en, this message translates to:
  /// **'Payment Type'**
  String get checkoutPaymentType;

  /// No description provided for @payTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Type'**
  String get payTypeTitle;

  /// No description provided for @payTypeAsYouGo.
  ///
  /// In en, this message translates to:
  /// **'Pay as you go'**
  String get payTypeAsYouGo;

  /// No description provided for @payTypeAsYouGoBody.
  ///
  /// In en, this message translates to:
  /// **'Pay only for the next delivery. We’ll send a payment link before each subsequent delivery.'**
  String get payTypeAsYouGoBody;

  /// No description provided for @payTypeToday.
  ///
  /// In en, this message translates to:
  /// **'{amount} Today'**
  String payTypeToday(String amount);

  /// No description provided for @payTypeUpfront.
  ///
  /// In en, this message translates to:
  /// **'Pay upfront'**
  String get payTypeUpfront;

  /// No description provided for @payTypeUpfrontBody.
  ///
  /// In en, this message translates to:
  /// **'Pay all deliveries in the next 4 weeks, or next month\'s deliveries.'**
  String get payTypeUpfrontBody;

  /// No description provided for @payTypeUpfrontTotal.
  ///
  /// In en, this message translates to:
  /// **'{count} Deliveries × {price} = {total}'**
  String payTypeUpfrontTotal(int count, String price, String total);

  /// No description provided for @deliveryPayBefore.
  ///
  /// In en, this message translates to:
  /// **'Pay before {when} to receive your order'**
  String deliveryPayBefore(String when);

  /// No description provided for @upfrontCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Pay Upfront'**
  String get upfrontCardTitle;

  /// No description provided for @cancelDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Cancel Delivery'**
  String get cancelDeliveryTitle;

  /// No description provided for @cancelDeliveryAll.
  ///
  /// In en, this message translates to:
  /// **'Cancel all deliveries'**
  String get cancelDeliveryAll;

  /// No description provided for @cancelDeliverySelect.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get cancelDeliverySelect;

  /// No description provided for @cancelDeliveryNote.
  ///
  /// In en, this message translates to:
  /// **'Deliveries for your selected dates will be cancelled'**
  String get cancelDeliveryNote;

  /// No description provided for @pauseDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Pause Delivery'**
  String get pauseDeliveryTitle;

  /// No description provided for @pauseDateRange.
  ///
  /// In en, this message translates to:
  /// **'Pause Date Range'**
  String get pauseDateRange;

  /// No description provided for @pauseRecovery.
  ///
  /// In en, this message translates to:
  /// **'Choose Recovery'**
  String get pauseRecovery;

  /// No description provided for @pauseRefund.
  ///
  /// In en, this message translates to:
  /// **'I Want Refund'**
  String get pauseRefund;

  /// No description provided for @pauseRefundAmount.
  ///
  /// In en, this message translates to:
  /// **'Refund Amount'**
  String get pauseRefundAmount;

  /// No description provided for @pauseRefundLine.
  ///
  /// In en, this message translates to:
  /// **'{count} Deliveries × {price}'**
  String pauseRefundLine(int count, String price);

  /// No description provided for @pauseExtend.
  ///
  /// In en, this message translates to:
  /// **'Extend Dates'**
  String get pauseExtend;

  /// No description provided for @pauseExtendedTill.
  ///
  /// In en, this message translates to:
  /// **'Extended Till'**
  String get pauseExtendedTill;

  /// No description provided for @pauseSummary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get pauseSummary;

  /// No description provided for @pauseRangeNote.
  ///
  /// In en, this message translates to:
  /// **'All your deliveries from {from} to {to} will be Paused'**
  String pauseRangeNote(String from, String to);

  /// No description provided for @pauseRangeTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Pause Until Date'**
  String get pauseRangeTitle;

  /// No description provided for @pauseStart.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get pauseStart;

  /// No description provided for @pauseEnd.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get pauseEnd;

  /// No description provided for @pauseDaysValue.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 Day} other{{count} Days}}'**
  String pauseDaysValue(int count);

  /// No description provided for @resumeTitle.
  ///
  /// In en, this message translates to:
  /// **'Select Resume Date'**
  String get resumeTitle;

  /// No description provided for @resumeFrom.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get resumeFrom;

  /// No description provided for @resumeTo.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get resumeTo;

  /// No description provided for @resumeNote.
  ///
  /// In en, this message translates to:
  /// **'All your deliveries from {from} to {to} will be resumed'**
  String resumeNote(String from, String to);

  /// No description provided for @paymentCancelledTitle.
  ///
  /// In en, this message translates to:
  /// **'Your payment cancelled'**
  String get paymentCancelledTitle;

  /// No description provided for @scheduleSummaryCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 delivery} other{{count} deliveries}}'**
  String scheduleSummaryCount(int count);

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'A hero behind every drop'**
  String get splashTagline;

  /// No description provided for @authNeedHelp.
  ///
  /// In en, this message translates to:
  /// **'Need Help?'**
  String get authNeedHelp;

  /// No description provided for @authContactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get authContactUs;

  /// No description provided for @homeCurrentTime.
  ///
  /// In en, this message translates to:
  /// **'Current Time'**
  String get homeCurrentTime;

  /// No description provided for @homeTodaysOrders.
  ///
  /// In en, this message translates to:
  /// **'Todays Orders'**
  String get homeTodaysOrders;

  /// No description provided for @ordersSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search Order'**
  String get ordersSearchHint;

  /// No description provided for @pastOrdersTitle.
  ///
  /// In en, this message translates to:
  /// **'Past Orders'**
  String get pastOrdersTitle;

  /// No description provided for @reassignedTitle.
  ///
  /// In en, this message translates to:
  /// **'Re-Assigned'**
  String get reassignedTitle;

  /// No description provided for @orderStatusNewOrder.
  ///
  /// In en, this message translates to:
  /// **'New Order'**
  String get orderStatusNewOrder;

  /// No description provided for @orderStatusOrderPicked.
  ///
  /// In en, this message translates to:
  /// **'Order Picked'**
  String get orderStatusOrderPicked;

  /// No description provided for @orderStatusDropOff.
  ///
  /// In en, this message translates to:
  /// **'Drop Off'**
  String get orderStatusDropOff;

  /// No description provided for @orderStatusReassigned.
  ///
  /// In en, this message translates to:
  /// **'Re-Assigned'**
  String get orderStatusReassigned;

  /// No description provided for @orderNumber.
  ///
  /// In en, this message translates to:
  /// **'#{number}'**
  String orderNumber(String number);

  /// No description provided for @paymentPaid.
  ///
  /// In en, this message translates to:
  /// **'PAID'**
  String get paymentPaid;

  /// No description provided for @paymentPending.
  ///
  /// In en, this message translates to:
  /// **'PENDING'**
  String get paymentPending;

  /// No description provided for @paymentStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get paymentStatusLabel;

  /// No description provided for @orderDeliveryDateTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Date & Time'**
  String get orderDeliveryDateTime;

  /// No description provided for @orderAssignedOn.
  ///
  /// In en, this message translates to:
  /// **'Assigned On'**
  String get orderAssignedOn;

  /// No description provided for @orderDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Order Detail'**
  String get orderDetailTitle;

  /// No description provided for @orderTotalItems.
  ///
  /// In en, this message translates to:
  /// **'Total Items'**
  String get orderTotalItems;

  /// No description provided for @orderItemPack.
  ///
  /// In en, this message translates to:
  /// **'{volume} ML x {bottles} Bottles'**
  String orderItemPack(int volume, int bottles);

  /// No description provided for @orderItemQuantity.
  ///
  /// In en, this message translates to:
  /// **'Qty {quantity}'**
  String orderItemQuantity(String quantity);

  /// No description provided for @orderDeliveryLocation.
  ///
  /// In en, this message translates to:
  /// **'Delivery Location'**
  String get orderDeliveryLocation;

  /// No description provided for @orderLocationPhotos.
  ///
  /// In en, this message translates to:
  /// **'This will help you reach faster!'**
  String get orderLocationPhotos;

  /// No description provided for @orderCustomerDetail.
  ///
  /// In en, this message translates to:
  /// **'Customer Detail'**
  String get orderCustomerDetail;

  /// No description provided for @orderSpecialInstruction.
  ///
  /// In en, this message translates to:
  /// **'Special Instruction'**
  String get orderSpecialInstruction;

  /// No description provided for @orderReasonReassign.
  ///
  /// In en, this message translates to:
  /// **'Reason for reassign'**
  String get orderReasonReassign;

  /// No description provided for @orderReasonFail.
  ///
  /// In en, this message translates to:
  /// **'Reason for fail delivery'**
  String get orderReasonFail;

  /// No description provided for @orderReassign.
  ///
  /// In en, this message translates to:
  /// **'Re-Assign'**
  String get orderReassign;

  /// No description provided for @orderContactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get orderContactSupport;

  /// No description provided for @orderFailDelivery.
  ///
  /// In en, this message translates to:
  /// **'Fail Delivery'**
  String get orderFailDelivery;

  /// No description provided for @orderMarkDelivered.
  ///
  /// In en, this message translates to:
  /// **'Mark As Deliver'**
  String get orderMarkDelivered;

  /// No description provided for @orderCashCollected.
  ///
  /// In en, this message translates to:
  /// **'Cash Collected'**
  String get orderCashCollected;

  /// No description provided for @orderTotalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get orderTotalAmount;

  /// No description provided for @orderDirections.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get orderDirections;

  /// No description provided for @orderCallCustomer.
  ///
  /// In en, this message translates to:
  /// **'Call customer'**
  String get orderCallCustomer;

  /// No description provided for @reassignTitle.
  ///
  /// In en, this message translates to:
  /// **'Re-Assign Order'**
  String get reassignTitle;

  /// No description provided for @reassignMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to re-assign this order to another driver?'**
  String get reassignMessage;

  /// No description provided for @reassignReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Leave Reason'**
  String get reassignReasonHint;

  /// No description provided for @commonConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get commonConfirm;

  /// No description provided for @commonSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get commonSubmit;

  /// No description provided for @failDeliveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Fail Delivery'**
  String get failDeliveryTitle;

  /// No description provided for @failDeliveryPrompt.
  ///
  /// In en, this message translates to:
  /// **'Select A Reason For Failing This Delivery.'**
  String get failDeliveryPrompt;

  /// No description provided for @failReasonCustomerNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'Customer not available'**
  String get failReasonCustomerNotAvailable;

  /// No description provided for @failReasonWrongAddress.
  ///
  /// In en, this message translates to:
  /// **'Wrong address provided'**
  String get failReasonWrongAddress;

  /// No description provided for @failReasonAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied / No entry'**
  String get failReasonAccessDenied;

  /// No description provided for @failReasonPackageDamaged.
  ///
  /// In en, this message translates to:
  /// **'Package damaged'**
  String get failReasonPackageDamaged;

  /// No description provided for @failReasonRefused.
  ///
  /// In en, this message translates to:
  /// **'Refused delivery'**
  String get failReasonRefused;

  /// No description provided for @failReasonOther.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get failReasonOther;

  /// No description provided for @failReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get failReasonHint;

  /// No description provided for @profileMyDetails.
  ///
  /// In en, this message translates to:
  /// **'My Details'**
  String get profileMyDetails;

  /// No description provided for @profilePrivacyPolicies.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Policies'**
  String get profilePrivacyPolicies;

  /// No description provided for @faqsTitle.
  ///
  /// In en, this message translates to:
  /// **'FAQs'**
  String get faqsTitle;

  /// No description provided for @faqsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get faqsSubtitle;

  /// No description provided for @faqsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No questions yet'**
  String get faqsEmpty;

  /// No description provided for @detailsEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get detailsEmail;

  /// No description provided for @detailsMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get detailsMobile;

  /// No description provided for @detailsZone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get detailsZone;

  /// No description provided for @detailsRouteId.
  ///
  /// In en, this message translates to:
  /// **'Route ID'**
  String get detailsRouteId;

  /// No description provided for @detailsVehicleNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Number'**
  String get detailsVehicleNumber;

  /// No description provided for @failReasonRequired.
  ///
  /// In en, this message translates to:
  /// **'Select a reason for this failed delivery.'**
  String get failReasonRequired;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
