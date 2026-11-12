// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'ريان إي-فليت';

  @override
  String get commonRetry => 'إعادة المحاولة';

  @override
  String get commonContinue => 'متابعة';

  @override
  String get commonBack => 'رجوع';

  @override
  String get commonGoHome => 'الذهاب إلى الرئيسية';

  @override
  String get onboardingWelcomeTo => 'مرحبًا بك في';

  @override
  String get onboardingWelcomeTitle => 'عالم ريان للمياه';

  @override
  String get onboardingTagline => '~ جرعتك اليومية من الطبيعة ~';

  @override
  String get onboardingChooseLanguage => 'اختر اللغة';

  @override
  String get languageEnglish => 'الإنجليزية';

  @override
  String get languageArabic => 'العربية';

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navProducts => 'المنتجات';

  @override
  String get navCart => 'السلة';

  @override
  String get navFavourite => 'المفضلة';

  @override
  String get navProfile => 'حسابي';

  @override
  String get cartTitle => 'سلتي';

  @override
  String cartTitleCount(int count) {
    return 'سلتي ($count)';
  }

  @override
  String get cartEmptyTitle => 'سلتك فارغة حاليًا';

  @override
  String get cartEmptyMessage => 'يبدو أنك لم تضف أي منتج إلى سلتك بعد.';

  @override
  String get cartViewProducts => 'تصفح المنتجات';

  @override
  String get cartAddItem => 'إضافة منتج';

  @override
  String get cartCouponCode => 'رمز القسيمة';

  @override
  String get cartApplyCoupon => 'تطبيق قسيمة';

  @override
  String get cartViewAllCoupons => 'عرض كل القسائم';

  @override
  String get cartRemoveCoupon => 'إزالة القسيمة';

  @override
  String get cartOrderSummary => 'ملخص الطلب';

  @override
  String get cartItemTotal => 'إجمالي المنتجات';

  @override
  String get cartDiscount => 'الخصم';

  @override
  String cartDiscountValue(String amount) {
    return '- $amount';
  }

  @override
  String get cartDeliveryFee => 'رسوم التوصيل';

  @override
  String get cartVat => 'ضريبة القيمة المضافة';

  @override
  String get cartTotal => 'الإجمالي (شامل الضريبة)';

  @override
  String get cartCheckout => 'إتمام الطلب';

  @override
  String get cartLoginToContinue => 'سجّل الدخول للمتابعة';

  @override
  String cartMinimumTitle(String amount) {
    return 'تسوّق بمبلغ $amount إضافي لفتح الطلب';
  }

  @override
  String get cartMinimumMessage => 'أضف المزيد للوصول إلى الحد الأدنى للطلب';

  @override
  String cartPriceChanged(String price) {
    return 'تغيّر سعر المنتج إلى $price';
  }

  @override
  String get cartUnavailable => 'هذا المنتج لم يعد متوفرًا';

  @override
  String get cartRemove => 'إزالة';

  @override
  String get cartPriceChangedQuestion => 'هل ما زلت تريد المتابعة؟';

  @override
  String get cartRemoveItem => 'إزالة المنتج';

  @override
  String get couponsTitle => 'رمز القسيمة';

  @override
  String get couponsInputHint => 'أدخل رمز القسيمة';

  @override
  String get couponsApplyList => 'القسائم المتاحة';

  @override
  String get couponsNotApplicable => 'هذه القسيمة غير قابلة للتطبيق';

  @override
  String get couponsTerms => 'الشروط والأحكام';

  @override
  String get couponsRemove => 'إزالة';

  @override
  String get couponsClearCode => 'مسح الرمز';

  @override
  String get couponsEmptyTitle => 'لا توجد قسائم متاحة';

  @override
  String get couponsEmptyGuest =>
      'سجّل الدخول لمعرفة العروض الحصرية المتاحة لك.';

  @override
  String get couponsEmptyMessage =>
      'لا توجد قسائم متاحة حاليًا. تحقق لاحقًا من العروض الجديدة.';

  @override
  String get notFoundTitle => 'الصفحة غير موجودة';

  @override
  String get notFoundMessage => 'الصفحة التي تبحث عنها غير موجودة.';

  @override
  String get errorGenericTitle => 'حدث خطأ ما';

  @override
  String get errorNetworkTitle => 'لا يوجد اتصال بالإنترنت';

  @override
  String get errorNetworkMessage => 'تحقق من اتصالك وحاول مرة أخرى.';

  @override
  String get errorServerMessage => 'تعذر إكمال طلبك. يرجى المحاولة مرة أخرى.';

  @override
  String get errorUnauthorizedMessage =>
      'انتهت صلاحية جلستك. يرجى تسجيل الدخول مرة أخرى.';

  @override
  String get errorValidationMessage => 'يرجى مراجعة الحقول المحددة.';

  @override
  String get errorUnexpectedMessage =>
      'حدث خطأ غير متوقع. يرجى المحاولة مرة أخرى.';

  @override
  String get homeSelectLocation => 'اختر الموقع';

  @override
  String get homeChangeLocation => 'تغيير موقع التوصيل';

  @override
  String get homeNotifications => 'الإشعارات';

  @override
  String get homeSearchHint => 'ابحث عن';

  @override
  String get homeSearchHighlight => '\"مياه فوارة\"';

  @override
  String get homeFreeDelivery => 'توصيل مجاني لكل طلب';

  @override
  String homeMinimumOrder(String amount) {
    return 'الحد الأدنى للطلب $amount';
  }

  @override
  String get homeCategoriesEyebrow => 'نقاء من الطبيعة';

  @override
  String get homeCategoriesTitle => 'انتعاش في كل قطرة';

  @override
  String get homeOurBestseller => 'الأكثر مبيعاً';

  @override
  String get homeEasyReorder => 'إعادة الطلب بسهولة';

  @override
  String get homeMosqueTitle => 'توصيل للمساجد القريبة';

  @override
  String get homeMosqueSubtitle => 'نوصل المياه مجانًا إلى المساجد القريبة';

  @override
  String get homeUpcomingDelivery => 'التوصيل المتكرر القادم';

  @override
  String homeOrderNumber(String number) {
    return 'رقم الطلب: $number';
  }

  @override
  String get homeReorder => 'إعادة الطلب';

  @override
  String get homeWhatsNew => 'الجديد';

  @override
  String get homeBestSellers => 'الأكثر مبيعاً';

  @override
  String get homeFooterTagline => 'نقاء من الطبيعة،\nكمال من المصدر.';

  @override
  String get homeFooterOrigin => 'من قلب قطر';

  @override
  String get homeEmptyTitle => 'لا يوجد ما يُعرض بعد';

  @override
  String get homeEmptyMessage => 'اسحب للأسفل للتحديث.';

  @override
  String homeBannerLabel(int index, int count) {
    return 'العرض $index من $count';
  }

  @override
  String productBottles(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count زجاجة',
      many: '$count زجاجة',
      few: '$count زجاجات',
      two: 'زجاجتان',
      one: 'زجاجة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get productUnitMl => 'مل';

  @override
  String get productAddToCart => 'أضف إلى السلة';

  @override
  String get productAddToFavourites => 'أضف إلى المفضلة';

  @override
  String get commonClose => 'إغلاق';

  @override
  String get commonClear => 'مسح';

  @override
  String get commonClearAll => 'مسح الكل';

  @override
  String get commonViewAll => 'عرض الكل';

  @override
  String get commonSearch => 'بحث';

  @override
  String get commonClearSearch => 'مسح البحث';

  @override
  String get commonLogin => 'تسجيل الدخول';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonUpdate => 'تحديث';

  @override
  String get commonDelete => 'حذف';

  @override
  String get commonEdit => 'تعديل';

  @override
  String get commonReset => 'إعادة تعيين';

  @override
  String get commonApply => 'تطبيق';

  @override
  String get commonBackToTop => 'العودة للأعلى';

  @override
  String get commonMore => 'المزيد';

  @override
  String get commonLess => 'أقل';

  @override
  String productCups(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أكواب',
      one: 'كوب واحد',
    );
    return '$_temp0';
  }

  @override
  String productSizeLine(int volume, String pack) {
    return '$volume مل × $pack';
  }

  @override
  String productVariantLabel(int volume, int count) {
    return '$volume مل × $count';
  }

  @override
  String get productIncrease => 'زيادة الكمية';

  @override
  String get productDecrease => 'تقليل الكمية';

  @override
  String get productRemoveFromFavourites => 'إزالة من المفضلة';

  @override
  String get productOutOfStock => 'نفدت الكمية';

  @override
  String get productNotifyMe => 'أبلغني';

  @override
  String get productNotifyRequested => 'سنبلغك';

  @override
  String get productAddToCartCta => 'أضف إلى السلة';

  @override
  String favouritesRemoveTitle(String name) {
    return 'إزالة $name من المفضلة؟';
  }

  @override
  String get favouritesRemoveMessage =>
      'هل أنت متأكد أنك تريد إزالة المنتج من قائمة المفضلة؟';

  @override
  String get favouritesRemoveAction => 'إزالة';

  @override
  String get notificationsTitle => 'الإشعارات';

  @override
  String get notificationsToday => 'اليوم';

  @override
  String get notificationsYesterday => 'أمس';

  @override
  String get notificationsUnread => 'غير مقروء';

  @override
  String get notificationsEmptyTitle => 'لا توجد إشعارات بعد!';

  @override
  String get notificationsEmptyMessage =>
      'ترقّب هذه المساحة، ستصلك إشعارات قريبًا جدًا..';

  @override
  String get timeJustNow => 'الآن';

  @override
  String timeMinutesShort(int count) {
    return '$count د';
  }

  @override
  String timeHoursShort(int count) {
    return '$count س';
  }

  @override
  String timeDaysShort(int count) {
    return '$count ي';
  }

  @override
  String get authLoginTitle => 'أدخل رقم الجوال';

  @override
  String get authLoginSubtitle => 'سجّل الدخول برقم جوال محلي صالح';

  @override
  String get authMobileHint => 'رقم الجوال';

  @override
  String get authIncorrectNumber => 'رقم غير صحيح';

  @override
  String get authOrLoginWith => 'أو سجّل الدخول باستخدام';

  @override
  String get authGoogle => 'Google';

  @override
  String get authApple => 'Apple';

  @override
  String get authOtpTitle => 'تحقق من رقم الجوال';

  @override
  String authOtpSubtitle(int length) {
    return 'يرجى إدخال رمز التحقق المكوّن من $length أرقام المرسل إلى';
  }

  @override
  String get authOtpEdit => 'تعديل';

  @override
  String authOtpFieldLabel(int length) {
    return 'رمز التحقق المكوّن من $length أرقام';
  }

  @override
  String get authOtpNotReceived => 'لم يصلك رمز التحقق؟';

  @override
  String get authOtpResend => 'إعادة الإرسال';

  @override
  String get authOtpVerify => 'تحقق';

  @override
  String get authOtpIncorrect => 'رمز التحقق غير صحيح';

  @override
  String get authDetailsTitle => 'أكمل بياناتك';

  @override
  String get authDetailsSubtitle => 'يرجى إدخال بياناتك';

  @override
  String get authNameLabel => 'الاسم';

  @override
  String get authNameHint => 'أدخل اسمك';

  @override
  String get authNameMissing => 'أدخل اسمك';

  @override
  String get authMobileLabel => 'رقم الجوال';

  @override
  String get authMobileVerified => 'رقم موثّق';

  @override
  String get profileVerified => 'تم التحقق';

  @override
  String get authEmailLabel => 'البريد الإلكتروني';

  @override
  String get authEmailHint => 'أدخل بريدك الإلكتروني';

  @override
  String get authEmailMissing => 'أدخل بريدك الإلكتروني';

  @override
  String get authEmailIncorrect => 'بريد إلكتروني غير صحيح';

  @override
  String get productsTitle => 'تصفح المنتجات';

  @override
  String get productsAll => 'الكل';

  @override
  String get productsAllProducts => 'جميع المنتجات';

  @override
  String get productsChangeMosque => 'تغيير المسجد';

  @override
  String productsFoundCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم العثور على $count منتج',
      many: 'تم العثور على $count منتجًا',
      few: 'تم العثور على $count منتجات',
      two: 'تم العثور على منتجين',
      one: 'تم العثور على منتج واحد',
      zero: 'لا توجد منتجات',
    );
    return '$_temp0';
  }

  @override
  String searchResultsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نتيجة',
      many: '$count نتيجة',
      few: '$count نتائج',
      two: 'نتيجتان',
      one: 'نتيجة واحدة',
      zero: 'لا توجد نتائج',
    );
    return '$_temp0';
  }

  @override
  String get subscribeSaveTag => 'اشترك ووفّر';

  @override
  String get subscribeSaveGet => 'احصل على ';

  @override
  String subscribeSaveOff(int percent) {
    return 'خصم $percent%';
  }

  @override
  String get subscribeSaveOn => ' على\n';

  @override
  String get subscribeSaveRecurring => 'توصيلات المياه';

  @override
  String get subscribeSaveBottles => '\nالمتكررة';

  @override
  String get subscribeSaveFrequencies => 'يوميًا • أسبوعيًا • شهريًا';

  @override
  String get subscribeSaveAction => 'اشترك الآن';

  @override
  String get productsFilter => 'تصفية';

  @override
  String get productsFilterActive => 'تصفية، مطبقة';

  @override
  String get productsEmptyTitle => 'لا توجد منتجات';

  @override
  String get productsEmptyMessage => 'جرّب فئة أخرى أو امسح عوامل التصفية.';

  @override
  String get productsClearFilters => 'مسح التصفية';

  @override
  String get filterTitle => 'تصفية';

  @override
  String get filterSizes => 'الأحجام';

  @override
  String get filterCategory => 'الفئة';

  @override
  String get filterBrand => 'العلامة التجارية';

  @override
  String filterSizeOption(int ml) {
    return '$ml مل';
  }

  @override
  String get searchRecent => 'عمليات البحث الأخيرة';

  @override
  String searchNotFoundTitle(String query) {
    return 'عذرًا! لم نجد منتجًا يطابق “$query”';
  }

  @override
  String get searchNotFoundMessage => 'اكتشف ما ستحبه من فئاتنا.';

  @override
  String get productSizes => 'الأحجام';

  @override
  String get productAddOns => 'إضافات';

  @override
  String get productViewCart => 'عرض السلة';

  @override
  String get productBackInStockHint => 'سنخبرك عند توفره مجددًا.';

  @override
  String get addressesSearchHint => 'ابحث عن منطقة أو اسم شارع...';

  @override
  String get addressesCurrentLocation => 'الموقع الحالي';

  @override
  String get addressesAddNew => 'إضافة عنوان جديد';

  @override
  String get addressesSaved => 'العناوين المحفوظة';

  @override
  String get addressesSuggestions => 'اقتراحات';

  @override
  String get addressesSelected => 'محدد';

  @override
  String addressesMoreOptions(String name) {
    return 'خيارات أخرى لـ $name';
  }

  @override
  String get addressesGuestTitle => 'سجّل الدخول لحفظ عناوينك';

  @override
  String get addressesGuestMessage =>
      'سجّل الدخول لحفظ عناوينك والوصول إليها بسهولة متى احتجت إليها.';

  @override
  String get addressesEmptyTitle => 'لا توجد عناوين محفوظة';

  @override
  String get addressesEmptyMessage =>
      'أضف عنوانك لإتمام الطلب بشكل أسرع وتوصيل أسهل.';

  @override
  String addressesNotFoundTitle(String query) {
    return 'لم نتمكن من العثور على موقع يطابق “$query”';
  }

  @override
  String get addressesNotFoundMessage => 'جرّب البحث عن المنطقة أو معلم قريب.';

  @override
  String get addressesDeleteTitle => 'حذف هذا العنوان؟';

  @override
  String addressesDeleteMessage(String name) {
    return 'ستتم إزالة $name من عناوينك المحفوظة.';
  }

  @override
  String get mapPinHint => 'حرّك الدبوس إلى موقع التوصيل بدقة';

  @override
  String get mapLoginPrompt => 'سجّل الدخول لاستخدام عناوينك المحفوظة';

  @override
  String get mapDeliverHere => 'سيتم توصيل الطلب هنا';

  @override
  String get mapConfirm => 'تأكيد الموقع';

  @override
  String get mosquesEmptyTitle => 'لا توجد مساجد قريبة';

  @override
  String get mosquesEmptyMessage =>
      'لم نعثر على مسجد بالقرب منك حتى الآن. حاول مرة أخرى لاحقًا.';

  @override
  String get mapLocating => 'جارٍ تحديد العنوان…';

  @override
  String get mapOutsideTitle => 'هذا الموقع خارج منطقة التوصيل';

  @override
  String get mapOutsideMessage =>
      'لا نوصّل حاليًا إلى هذا الموقع. جرّب موقعًا قريبًا أو اختر من عناوينك المحفوظة.';

  @override
  String get mapPlaceholder => 'معاينة الخريطة. اسحب لتحريك الدبوس.';

  @override
  String get addressFormNewTitle => 'أكمل عنوانك';

  @override
  String get addressFormEditTitle => 'تعديل عنوانك';

  @override
  String get addressFormChange => 'تغيير';

  @override
  String get addressFormPhotosTitle => 'ساعد السائقين في الوصول إليك أسرع!';

  @override
  String get addressFormPhotosMessage => 'أضف صورة لتعبئة عنوانك تلقائيًا.';

  @override
  String get addressFormBluePlate => 'صورة اللوحة الزرقاء';

  @override
  String get addressFormBuildingPhoto => 'إضافة صورة المبنى';

  @override
  String get addressFormRemovePhoto => 'إزالة الصورة';

  @override
  String get addressFormUploadTitle => 'رفع صورة';

  @override
  String get addressFormCapture => 'التقاط صورة';

  @override
  String get addressFormGallery => 'الرفع من المعرض';

  @override
  String get addressFormZone => 'المنطقة';

  @override
  String get addressFormStreet => 'الشارع';

  @override
  String get addressFormBuilding => 'رقم المبنى';

  @override
  String get addressFormUnit => 'رقم الشقة / الوحدة';

  @override
  String get addressFormType => 'نوع الموقع';

  @override
  String get addressFormOther => 'أخرى';

  @override
  String get addressFormDirections => 'كيفية الوصول (اختياري)';

  @override
  String get addressFormDirectionsHint => 'أدخل';

  @override
  String get addressFormDefault => 'تعيين هذا العنوان كافتراضي';

  @override
  String get addressTypeHome => 'المنزل';

  @override
  String get addressTypeWork => 'العمل';

  @override
  String get addressTypeFamily => 'العائلة';

  @override
  String get addressTypeOther => 'أخرى';

  @override
  String get addressTypeMosque => 'مسجد';

  @override
  String get favouritesTitle => 'مفضلتي';

  @override
  String get favouritesSubtitle => 'نعلم أنك تحبها!';

  @override
  String get favouritesEmptyTitle => 'لا توجد مفضلات بعد';

  @override
  String get favouritesEmptyMessage =>
      'أعجبك شيء؟ أضفه إلى مفضلتك للوصول إليه بسهولة لاحقًا.';

  @override
  String get favouritesGuestMessage =>
      'سجّل أو سجّل الدخول لحفظ المنتجات في قائمة رغباتك والوصول إليها لاحقًا.';

  @override
  String get favouritesViewProducts => 'عرض المنتجات';

  @override
  String get checkoutTitle => 'إتمام الطلب';

  @override
  String get checkoutEdit => 'تعديل';

  @override
  String get checkoutChange => 'تغيير';

  @override
  String get checkoutDeliveryMode => 'طريقة التوصيل';

  @override
  String get checkoutRepeatHint => 'اختر تاريخ ووقت التوصيل المتكرر';

  @override
  String get checkoutDeliverHere => 'سنوصل طلبك إلى هنا';

  @override
  String get checkoutNoAddress => 'أضف عنوانًا للتوصيل';

  @override
  String get checkoutAwayNotice =>
      'أنت بعيد عن الموقع المحدد. اضغط تغيير للطلب من موقعك الحالي.';

  @override
  String get checkoutOutsideQatarNotice =>
      'أنت خارج قطر. اضغط تغيير الموقع للطلب. الدفع بالبطاقة فقط متاح (الدفع عند الاستلام غير متاح).';

  @override
  String get checkoutInstruction => 'تعليمات خاصة (اختياري)';

  @override
  String get checkoutInstructionHint => 'أضف تعليمات خاصة';

  @override
  String get checkoutAdd => 'إضافة';

  @override
  String get checkoutEditInstruction => 'تعديل';

  @override
  String get checkoutBillSummary => 'ملخص الفاتورة';

  @override
  String checkoutBillLine(String name, int volume, int pack, int qty) {
    return '$name ($volume مل × $pack) ×$qty';
  }

  @override
  String get checkoutRepeatBillNote =>
      'ادفع ثمن التوصيلة الحالية الآن. ستظهر تذكيرات الدفعات القادمة في طلباتي والرئيسية';

  @override
  String get checkoutShowBill => 'عرض تفاصيل الفاتورة';

  @override
  String get checkoutHideBill => 'إخفاء تفاصيل الفاتورة';

  @override
  String get checkoutPaymentMethod => 'طريقة الدفع';

  @override
  String get checkoutPayByCard => 'الدفع بالبطاقة';

  @override
  String get checkoutSavedCards => 'البطاقات المحفوظة';

  @override
  String checkoutCardMasked(String brand, String last4) {
    return '$brand •••• •••• •••• $last4';
  }

  @override
  String checkoutCardExpires(String expiry) {
    return 'تنتهي $expiry';
  }

  @override
  String get checkoutBrandVisa => 'Visa';

  @override
  String get checkoutBrandMastercard => 'Mastercard';

  @override
  String get checkoutBrandAmex => 'Amex';

  @override
  String get checkoutBrandOther => 'بطاقة';

  @override
  String get checkoutCvv => 'CVV';

  @override
  String get checkoutAddNewCard => 'إضافة بطاقة جديدة';

  @override
  String get checkoutPayByQPay => 'الدفع عبر QPay';

  @override
  String get checkoutQPaySubtitle => 'ادفع ببطاقة QPay للخصم المباشر';

  @override
  String get checkoutPayByCash => 'الدفع نقدًا';

  @override
  String get checkoutCashSubtitle => 'ادفع نقدًا للسائق مباشرة';

  @override
  String get checkoutTaxNote => 'الأسعار شاملة الضرائب';

  @override
  String get checkoutPlaceOrder => 'تأكيد الطلب';

  @override
  String get checkoutToday => 'اليوم';

  @override
  String get checkoutTomorrow => 'غدًا';

  @override
  String get checkoutAnotherDate => 'اختر تاريخًا آخر';

  @override
  String checkoutWhenToday(String slot) {
    return 'اليوم، $slot';
  }

  @override
  String checkoutWhenTomorrow(String slot) {
    return 'غدًا، $slot';
  }

  @override
  String checkoutWhenDate(String date, String slot) {
    return '$date | $slot';
  }

  @override
  String checkoutWhenDay(String date, String slot) {
    return '$date، $slot';
  }

  @override
  String get checkoutSlotSheetTitle => 'اختر تاريخ ووقت التوصيل';

  @override
  String get checkoutDate => 'التاريخ';

  @override
  String get checkoutTimeSlot => 'الفترة الزمنية';

  @override
  String get checkoutEstimated => 'موعد التوصيل المتوقع';

  @override
  String get checkoutConfirm => 'تأكيد';

  @override
  String get checkoutChangeDate => 'تغيير التاريخ';

  @override
  String get checkoutPrevMonth => 'الشهر السابق';

  @override
  String get checkoutNextMonth => 'الشهر التالي';

  @override
  String get checkoutFrequency => 'التكرار';

  @override
  String get checkoutWeekly => 'أسبوعيًا';

  @override
  String get checkoutMonthly => 'شهريًا';

  @override
  String get checkoutUntilCancel => 'حتى ألغي';

  @override
  String get checkoutInstructionSheetHint => 'اكتب تعليماتك الخاصة...';

  @override
  String get checkoutChipNoBell => 'لا تقرع الجرس';

  @override
  String get checkoutChipDoor => 'التوصيل عند الباب';

  @override
  String get checkoutChipHand => 'سلّمني الطلب باليد';

  @override
  String checkoutCounter(String count, int max) {
    return '$count/$max';
  }

  @override
  String get checkoutCardNumber => 'رقم البطاقة';

  @override
  String get checkoutCardNumberHint => '0000 0000 0000 0000';

  @override
  String get checkoutCardHolder => 'اسم حامل البطاقة';

  @override
  String get checkoutExpiry => 'تاريخ الانتهاء';

  @override
  String get checkoutExpiryHint => 'MM/YY';

  @override
  String get checkoutSaveCard => 'احفظ البطاقة للمدفوعات القادمة';

  @override
  String get paymentDetailsTitle => 'تفاصيل الدفع';

  @override
  String get paymentHoldOn => 'لحظة من فضلك!';

  @override
  String get paymentVerifying => 'نتحقق من حالة الدفع';

  @override
  String get paymentNoteLabel => 'ملاحظة:';

  @override
  String get paymentNoteText =>
      'لا تضغط زر الرجوع ولا تغلق هذه الشاشة حتى تكتمل العملية';

  @override
  String get paymentCancelTitle => 'هل أنت متأكد أنك تريد إلغاء الدفع؟';

  @override
  String get paymentCancelMessage =>
      'سيتم إلغاء طلب الدفع بينما نتحقق من حالة الدفع.';

  @override
  String get paymentNotNow => 'ليس الآن';

  @override
  String get paymentYesCancel => 'نعم، إلغاء';

  @override
  String get paymentFailedTitle => 'فشلت عملية الدفع';

  @override
  String get paymentChangeMethod => 'تغيير طريقة الدفع';

  @override
  String get receiptItems => 'المنتجات';

  @override
  String receiptQty(String size, String qty) {
    return '$size | الكمية $qty';
  }

  @override
  String get orderPlacedTitle => 'تم تأكيد الطلب';

  @override
  String get orderPlacedThanks => 'شكرًا لشرائك!';

  @override
  String get receiptSpecialInstruction => 'تعليمات خاصة';

  @override
  String get receiptPaymentMode => 'طريقة الدفع';

  @override
  String get receiptDeliveryDateTime => 'تاريخ ووقت التوصيل';

  @override
  String get profileEditTitle => 'تعديل الملف الشخصي';

  @override
  String get commonNotNow => 'ليس الآن';

  @override
  String get commonGoBack => 'رجوع';

  @override
  String get languageNativeEnglish => 'English';

  @override
  String get languageNativeArabic => 'عربي';

  @override
  String get profileTitle => 'حسابي';

  @override
  String get profileGuestTitle => 'زائر';

  @override
  String get profileGuestMessage =>
      'سجّل الدخول أو أنشئ حسابًا لعرض ملفك الكامل';

  @override
  String get profileLoginSignUp => 'تسجيل الدخول / إنشاء حساب';

  @override
  String get profileChangeLanguage => 'تغيير اللغة';

  @override
  String get profileLanguageShortEn => 'Eng';

  @override
  String get profileLanguageShortAr => 'عربي';

  @override
  String get profilePointsLabel => 'نقطة';

  @override
  String profilePointsWorth(String amount) {
    return 'قيمتها $amount';
  }

  @override
  String profilePointsExpiring(String points, int days) {
    return '$points نقطة تنتهي خلال $days يومًا';
  }

  @override
  String get profileOpenRewards => 'فتح المكافآت';

  @override
  String get profileMyProfile => 'ملفي';

  @override
  String get profileMyOrders => 'طلباتي';

  @override
  String get profileSavedAddress => 'العناوين المحفوظة';

  @override
  String get profileSavedCards => 'البطاقات المحفوظة';

  @override
  String get profileRewardsOffers => 'المكافآت والعروض';

  @override
  String get profileHowToEarn => 'كيف تكسب وتستبدل';

  @override
  String get profileOffers => 'العروض';

  @override
  String get profileSupportMore => 'الدعم والمزيد';

  @override
  String get profileWhatsApp => 'الدعم عبر واتساب';

  @override
  String get profileTermsPolicies => 'الشروط والسياسات';

  @override
  String get profileLogout => 'تسجيل الخروج';

  @override
  String get profileChangeLanguageTitle => 'تغيير اللغة';

  @override
  String get profileLogoutTitle => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get profileLogoutMessage =>
      'لن تتمكن من الوصول إلى سلتك والعناصر المحفوظة حتى تسجّل الدخول مجددًا.';

  @override
  String get profileWhatsAppUnavailableTitle => 'واتساب غير متاح';

  @override
  String get profileWhatsAppUnavailableMessage => 'ثبّت واتساب أو حاول لاحقًا.';

  @override
  String get commonOk => 'حسنًا';

  @override
  String get profileChangeMobile => 'تغيير رقم الجوال';

  @override
  String get profileChangeEmail => 'تغيير البريد الإلكتروني';

  @override
  String get profileChangeMobileTitle =>
      'هل أنت متأكد أنك تريد تغيير رقم الجوال؟';

  @override
  String get profileChangeMobileMessage =>
      'لتغيير رقم جوالك، عليك أولًا التحقق من رقمك الحالي.';

  @override
  String get profileYesChange => 'نعم، تغيير';

  @override
  String get profileVerifyEmailTitle => 'تحقق من بريدك الإلكتروني';

  @override
  String get profileNewMobileTitle => 'أدخل رقم الجوال الجديد';

  @override
  String get profileNewMobileSubtitle =>
      'أدخل رقم الجوال الذي تريد استخدامه لحسابك.';

  @override
  String get profileNewEmailTitle => 'أدخل البريد الإلكتروني الجديد';

  @override
  String get profileNewEmailSubtitle =>
      'أدخل البريد الإلكتروني الذي تريد استخدامه لحسابك.';

  @override
  String get profileNumberTaken => 'هذا الرقم مستخدم بالفعل';

  @override
  String get profileEmailTaken => 'هذا البريد الإلكتروني مستخدم بالفعل';

  @override
  String get savedAddressesTitle => 'العناوين المحفوظة';

  @override
  String get savedAddressesEmptyTitle => 'لا توجد عناوين محفوظة';

  @override
  String get savedAddressesEmptyMessage =>
      'أضف عنوانًا لتسريع إتمام الطلب في المرة القادمة.';

  @override
  String get savedAddressesDeleteTitle =>
      'هل أنت متأكد أنك تريد حذف هذا العنوان؟';

  @override
  String get savedCardsTitle => 'البطاقات المحفوظة';

  @override
  String get savedCardsEmptyTitle => 'لا توجد بطاقات محفوظة';

  @override
  String get savedCardsGuestMessage =>
      'سجّل الدخول لحفظ بطاقاتك واستخدامها لإتمام الطلب بسرعة.';

  @override
  String get savedCardsEmptyMessage =>
      'أضف بطاقة لتسريع إتمام الطلب في المرة القادمة.';

  @override
  String get savedCardsEditTitle => 'تعديل البطاقة';

  @override
  String get savedCardsDeleteTitle => 'هل أنت متأكد أنك تريد حذف هذه البطاقة؟';

  @override
  String savedCardsMore(String card) {
    return 'خيارات إضافية لـ $card';
  }

  @override
  String get offersTitle => 'العروض';

  @override
  String get offersAvailable => 'القسائم المتاحة';

  @override
  String get offersCopyCode => 'نسخ الرمز';

  @override
  String get offersTermsTitle => 'الشروط والأحكام';

  @override
  String get offersUnderstood => 'فهمت';

  @override
  String get policiesTitle => 'الشروط والسياسات';

  @override
  String get policyAboutUs => 'من نحن';

  @override
  String get policyTerms => 'الشروط والأحكام';

  @override
  String get policyPrivacy => 'سياسة الخصوصية';

  @override
  String get policyRefund => 'سياسة الإرجاع والاسترداد';

  @override
  String policyLastUpdated(String date) {
    return 'آخر تحديث $date';
  }

  @override
  String get deleteAccountLink => 'حذف الحساب';

  @override
  String get deleteAccountConfirmTitle => 'هل أنت متأكد أنك تريد حذف حسابك؟';

  @override
  String get deleteAccountConfirmMessage =>
      'حذف الحساب نهائي وستُزال جميع بياناتك لدى مياه ريان بشكل دائم.';

  @override
  String get deleteAccountTitle => 'حذف الحساب';

  @override
  String get deleteAccountIntro => 'ساعدنا لنخدمك بشكل أفضل مستقبلًا، شكرًا.';

  @override
  String get deleteAccountQuestion => 'ما الذي نحتاج إلى تحسينه؟';

  @override
  String get deleteReasonPerformance => 'أداء التطبيق';

  @override
  String get deleteReasonPrivacy => 'مخاوف تتعلق بالخصوصية';

  @override
  String get deleteReasonProducts => 'المنتجات المتاحة';

  @override
  String get deleteReasonService => 'مخاوف تتعلق بالخدمة';

  @override
  String get deleteReasonMultiple => 'حسابات متعددة';

  @override
  String get deleteReasonOthers => 'أخرى';

  @override
  String get deleteAccountSkip => 'تخطي وحذف';

  @override
  String get deleteAccountProceed => 'متابعة';

  @override
  String get deletedTitle => 'تمت جدولة حذف حسابك';

  @override
  String get deletedMessage =>
      'غيّرت رأيك؟ سجّل الدخول خلال 30 يومًا لاستعادة حسابك.';

  @override
  String get deletedGoLogin => 'الذهاب لتسجيل الدخول';

  @override
  String get deletedContinueGuest => 'المتابعة كزائر';

  @override
  String get ordersTitle => 'طلباتي';

  @override
  String get ordersTabOneTime => 'مرة واحدة';

  @override
  String get ordersTabRecurring => 'متكرر';

  @override
  String get ordersFilterAll => 'الكل';

  @override
  String get ordersFilterDelivered => 'تم التوصيل';

  @override
  String get ordersFilterPickedUp => 'تم الاستلام';

  @override
  String get ordersFilterConfirmed => 'مؤكد';

  @override
  String get ordersFilterFailed => 'فشلت';

  @override
  String get ordersFilterCancelled => 'ملغي';

  @override
  String get orderStatusConfirmed => 'تم تأكيد الطلب';

  @override
  String get orderStatusPickedUp => 'تم استلام الطلب';

  @override
  String get orderStatusDelivered => 'تم التوصيل';

  @override
  String get orderStatusFailed => 'فشل التوصيل';

  @override
  String get orderStatusCancelled => 'ملغي';

  @override
  String get ordersTagPaid => 'مدفوع';

  @override
  String get ordersTagCod => 'الدفع عند الاستلام';

  @override
  String ordersItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count منتج',
      few: '$count منتجات',
      two: 'منتجان',
      one: 'منتج واحد',
    );
    return '$_temp0';
  }

  @override
  String ordersItemQty(String name, int qty) {
    return '$name (الكمية $qty)';
  }

  @override
  String ordersOpen(String status) {
    return 'عرض التفاصيل، $status';
  }

  @override
  String get ordersEmptyTitle => 'لا توجد طلبات';

  @override
  String get ordersEmptyMessage => 'ستظهر هنا الطلبات المسندة إليك.';

  @override
  String get ordersFilterEmpty => 'لا توجد طلبات بهذه الحالة.';

  @override
  String get ordersRecurringEmptyTitle => 'لا توجد طلبات متكررة';

  @override
  String get ordersRecurringEmptyMessage =>
      'اختر تكرار الطلب عند الدفع لتصلك المياه حسب جدول.';

  @override
  String get ordersNextDelivery => 'التوصيل القادم';

  @override
  String subscriptionProgress(int delivered, int total) {
    return 'تم توصيل $delivered/$total';
  }

  @override
  String subscriptionOpenEnded(int delivered) {
    return 'تم توصيل $delivered (حتى الإلغاء)';
  }

  @override
  String subscriptionCancelledProgress(String progress) {
    return 'ملغي • $progress';
  }

  @override
  String subscriptionPausedProgress(String progress) {
    return 'متوقف مؤقتًا • $progress';
  }

  @override
  String orderTimeStamp(String date, String time) {
    return '$date | $time';
  }

  @override
  String get orderTypeLabel => 'نوع الطلب';

  @override
  String get orderTypeRecurring => 'توصيل متكرر';

  @override
  String orderItems(int count) {
    return 'المنتجات ($count)';
  }

  @override
  String get orderDriverDetails => 'تفاصيل السائق';

  @override
  String get orderCallDriver => 'اتصل بالسائق';

  @override
  String get orderPayAtDelivery => 'ادفع عند التوصيل';

  @override
  String orderPayWithPoints(String method) {
    return '$method + النقاط';
  }

  @override
  String get orderPointsRedeemed => 'النقاط المستبدلة';

  @override
  String get orderPointsEarned => 'النقاط المكتسبة';

  @override
  String get orderPointsRevoked => 'النقاط الملغاة';

  @override
  String orderPointsPlus(String amount) {
    return '+ $amount';
  }

  @override
  String orderPointsMinus(String amount) {
    return '- $amount';
  }

  @override
  String get orderPointsPendingNote => 'ستُضاف نقاط المكافأة بعد التوصيل';

  @override
  String orderPointsCancelledNote(String points) {
    return 'تم عكس $points نقطة بسبب الإلغاء';
  }

  @override
  String orderPointsFailedNote(String points) {
    return 'تم عكس $points نقطة لفشل الطلب';
  }

  @override
  String get orderFailedNotice =>
      'فشل الدفع. إذا تم خصم أي مبلغ، فسيُعاد تلقائيًا إلى وسيلة الدفع الأصلية.';

  @override
  String get orderCancelledNotice =>
      'تم إلغاء طلبك. سنتواصل معك بخصوص استرداد المبلغ.';

  @override
  String get orderCancel => 'إلغاء';

  @override
  String get orderDownloadInvoice => 'تحميل الفاتورة';

  @override
  String get orderPayForDelivery => 'ادفع للتوصيل';

  @override
  String get orderCancelTitle => 'هل أنت متأكد أنك تريد إلغاء هذا الطلب؟';

  @override
  String get orderCancelMessage =>
      'بعد الإلغاء لا يمكن استعادة هذا الطلب. هل تريد المتابعة؟';

  @override
  String get orderCancelConfirm => 'نعم، إلغاء';

  @override
  String get orderLinkFailed => 'تعذر الفتح. يرجى المحاولة مرة أخرى.';

  @override
  String get subscriptionStatusScheduled => 'تمت جدولة الطلب';

  @override
  String get subscriptionStatusCompleted => 'اكتمل الطلب';

  @override
  String get subscriptionStatusPaused => 'الطلب متوقف مؤقتًا';

  @override
  String get subscriptionPausedNotice =>
      'طلبك متوقف مؤقتًا. لمتابعة التوصيل، يجب استئنافه.';

  @override
  String get subscriptionPause => 'إيقاف مؤقت';

  @override
  String get subscriptionResume => 'استئناف';

  @override
  String get deliveryStatusDelivered => 'تم التوصيل';

  @override
  String get deliveryStatusPickedUp => 'تم استلام الطلب';

  @override
  String get deliveryStatusYetToDeliver => 'لم يتم التوصيل بعد';

  @override
  String get deliveryStatusPaused => 'متوقف مؤقتًا';

  @override
  String get deliveryStatusCancelled => 'ملغي';

  @override
  String deliveryNumbered(int number, int total, String status) {
    return '$number/$total $status';
  }

  @override
  String get deliveryTaxNote => 'الأسعار شاملة الضرائب';

  @override
  String get deliveryPayNow => 'ادفع الآن';

  @override
  String get cancelSubTitle => 'إلغاء الاشتراك';

  @override
  String get cancelReasonTooExpensive => 'مكلف جدًا';

  @override
  String get cancelReasonDelivery => 'مشاكل في التوصيل';

  @override
  String get cancelReasonSwitching => 'الانتقال إلى مزود آخر';

  @override
  String get cancelReasonPausing => 'إيقاف مؤقت';

  @override
  String get cancelReasonQuality => 'جودة المنتج';

  @override
  String get cancelSubWarning =>
      'لا يمكن التراجع عن ذلك. ستُزال أي عمليات توصيل متبقية.';

  @override
  String get cancelSubPausedNotice =>
      'إلغاء اشتراك متوقف مؤقتًا يزيل عمليات التوصيل المتبقية ويغلقه نهائيًا.';

  @override
  String get cancelSubConfirm => 'تأكيد الإلغاء';

  @override
  String get refundSummary => 'ملخص الاسترداد';

  @override
  String get refundRemaining => 'عمليات التوصيل المتبقية';

  @override
  String refundRemainingValue(int remaining, int total) {
    return '$remaining/$total';
  }

  @override
  String get refundUnused => 'قيمة عمليات التوصيل غير المستخدمة';

  @override
  String get refundDeductions => 'الخصومات (حسب السياسة)';

  @override
  String get refundDue => 'المبلغ المسترد';

  @override
  String get refundCodNote =>
      'لا يوجد ما يُسترد في اشتراكات الدفع عند الاستلام، فلم يتم تحصيل رسوم عمليات التوصيل القادمة.';

  @override
  String get refundConfirm => 'تأكيد واسترداد';

  @override
  String get cancelledTitle => 'تم إلغاء اشتراكك';

  @override
  String cancelledMessage(String name) {
    return 'تم إلغاء $name.';
  }

  @override
  String get cancelledOn => 'تاريخ الإلغاء';

  @override
  String get cancelledRefund => 'المبلغ المسترد';

  @override
  String get cancelledGoHome => 'الذهاب للرئيسية';

  @override
  String get cancelledOrderDetail => 'تفاصيل الطلب';

  @override
  String get pauseType => 'نوع الإيقاف';

  @override
  String get pauseForDeliveries => 'إيقاف لعدد من عمليات التوصيل';

  @override
  String get pauseDaysSkipped => 'الأيام المتخطاة';

  @override
  String get pauseNextDelivery => 'التوصيل القادم';

  @override
  String get pauseNothingLeft => 'لا توجد عمليات توصيل متبقية لإيقافها.';

  @override
  String get pauseFewer => 'عمليات توصيل أقل';

  @override
  String get pauseMore => 'عمليات توصيل أكثر';

  @override
  String get pauseSubmit => 'إيقاف الاشتراك';

  @override
  String get loyaltyTitle => 'نقاط الولاء';

  @override
  String get loyaltyHowTo => 'كيف تكسب وتستبدل';

  @override
  String get loyaltyTotalAvailable => 'إجمالي النقاط المتاحة';

  @override
  String loyaltyRate(String amount) {
    return 'النقطة = $amount';
  }

  @override
  String loyaltyPending(String points) {
    return '+$points نقطة معلّقة';
  }

  @override
  String get loyaltyPendingNote => 'ستُضاف بعد التوصيل';

  @override
  String get loyaltyExpiringSoon => 'تنتهي قريبًا';

  @override
  String get loyaltyPointsExpiringIn => 'نقطة تنتهي خلال';

  @override
  String loyaltyDaysLeft(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days يومًا',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String loyaltyFifoNote(int months) {
    return 'تُستخدم النقاط الأقدم أولًا. تنتهي صلاحية النقاط بعد $months شهرًا من اكتسابها.';
  }

  @override
  String get loyaltyHowToEarn => 'كيف تكسب وتستبدل';

  @override
  String loyaltyEarnLine(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points نقاط',
      one: 'نقطة واحدة',
    );
    return 'اكسب $_temp0 مقابل كل 1 ر.ق تنفقه';
  }

  @override
  String get loyaltyEarnNote => 'تُضاف بعد توصيل طلبك';

  @override
  String loyaltyRedeemLine(String points) {
    return '$points نقطة = خصم 1 ر.ق على طلبك';
  }

  @override
  String loyaltyRedeemNote(String min, int percent) {
    return 'الحد الأدنى للاستبدال $min نقطة، وحتى $percent% من قيمة السلة';
  }

  @override
  String get loyaltyViewTerms => 'عرض الشروط كاملة';

  @override
  String get loyaltyHistory => 'سجل المعاملات';

  @override
  String get loyaltyFilterAll => 'الكل';

  @override
  String get loyaltyFilterEarned => 'مكتسبة';

  @override
  String get loyaltyFilterRedeemed => 'مستبدلة';

  @override
  String get loyaltyFilterExpired => 'منتهية';

  @override
  String get loyaltyTxEarned => 'مكتسبة';

  @override
  String get loyaltyTxRedeemed => 'مستبدلة';

  @override
  String loyaltyTxExpired(int months) {
    return 'منتهية ($months شهرًا)';
  }

  @override
  String get loyaltyTxRefund => 'استرداد';

  @override
  String loyaltyTxMeta(String date, String reference) {
    return '$date • $reference';
  }

  @override
  String get loyaltyHistoryEmpty => 'لا يوجد نشاط للنقاط بعد.';

  @override
  String get howTitle => 'كيف تكسب وتستبدل';

  @override
  String get howSubtitle => 'شفافية كاملة في مزايا الولاء';

  @override
  String get howEarningTitle => 'كسب النقاط';

  @override
  String howEarningTag(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points نقاط',
      one: 'نقطة واحدة',
    );
    return '1 ر.ق = $_temp0';
  }

  @override
  String howEarningBody(int points) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points نقاط',
      one: 'نقطة واحدة',
    );
    return 'اكسب $_temp0 مقابل كل 1 ر.ق تنفقه على المشتريات المؤهلة';
  }

  @override
  String get howRedeemTitle => 'استبدال النقاط';

  @override
  String howRedeemTag(String amount) {
    return 'النقطة = $amount';
  }

  @override
  String howRedeemBody(String amount) {
    return 'قيمة كل نقطة $amount عند استبدالها في الدفع';
  }

  @override
  String get howValidityTitle => 'صلاحية النقاط';

  @override
  String howValidityTag(int months) {
    return 'صالحة لمدة $months شهرًا';
  }

  @override
  String howValidityBody(int months) {
    return 'تنتهي صلاحية النقاط بعد $months شهرًا من اكتسابها. تُستخدم النقاط الأقدم أولًا';
  }

  @override
  String get howRulesTitle => 'قواعد الاستبدال';

  @override
  String get howMinimumLabel => 'الحد الأدنى';

  @override
  String howMinimumValue(String points) {
    return '$points نقطة';
  }

  @override
  String get howMaximumLabel => 'الحد الأقصى';

  @override
  String howMaximumValue(int percent) {
    return '$percent% من السلة';
  }

  @override
  String get howMultiplesLabel => 'استخدم النقاط بمضاعفات';

  @override
  String get howExampleTitle => 'مثال';

  @override
  String howExampleBody(String order, String max, String points, String min) {
    return 'في طلب بقيمة $order، أقصى ما يمكنك استبداله $max ($points نقطة)، وهو أعلى بكثير من الحد الأدنى البالغ $min نقطة، لذا يمكنك الاستبدال بأي قيمة بينهما.';
  }

  @override
  String get howExclusions => 'الاستثناءات';

  @override
  String get howExDelivery => 'رسوم التوصيل';

  @override
  String get howExDeliveryNote => 'مستثناة من حساب النقاط';

  @override
  String get howExCod => 'رسوم الدفع عند الاستلام';

  @override
  String get howExCodNote => 'لا يمكن تغطيتها بالنقاط';

  @override
  String get howExDiscounted => 'المنتجات المخفّضة مسبقًا';

  @override
  String get howExDiscountedNote =>
      'المنتجات الترويجية لا تكسب النقاط ولا تقبلها';

  @override
  String get howExGift => 'بطاقات الهدايا';

  @override
  String get howExGiftNote => 'مستثناة من مزايا الولاء';

  @override
  String get cartUsePoints => 'استخدم نقاط الولاء';

  @override
  String get cartAvailablePoints => 'النقاط المتاحة';

  @override
  String cartPointsBalance(String points) {
    return '$points نقطة';
  }

  @override
  String get cartRedeemPoints => 'استبدال النقاط';

  @override
  String cartRedeemHint(String points, String amount) {
    return 'استخدم $points نقطة لتوفير $amount';
  }

  @override
  String get cartEnterPoints => 'أدخل النقاط للاستبدال';

  @override
  String cartPointsRange(String min, String max) {
    return 'الحد الأدنى $min • الحد الأقصى $max نقطة';
  }

  @override
  String get cartPointsSuffix => 'نقطة';

  @override
  String cartPointsInvalid(String step, String min, String max) {
    return 'أدخل مضاعفًا لـ $step من $min إلى $max.';
  }

  @override
  String get cartPointsPromo =>
      'لا يمكن استبدال النقاط على المنتجات الترويجية أو المخفّضة في سلتك.';

  @override
  String cartPointsNotEnough(String min) {
    return 'تحتاج إلى $min نقطة على الأقل لاستبدال المكافآت في هذا الطلب.';
  }

  @override
  String cartPointsCartSmall(String min) {
    return 'أضف منتجات أكثر لاستبدال النقاط. تحتاج إلى $min نقطة على الأقل.';
  }

  @override
  String cartEarnNote(int points, String amount) {
    String _temp0 = intl.Intl.pluralLogic(
      points,
      locale: localeName,
      other: '$points نقاط',
      one: 'نقطة واحدة',
    );
    return 'رائع! اكسب $_temp0، حيث النقطة = $amount';
  }

  @override
  String get orderPlacedOn => 'تاريخ الطلب';

  @override
  String get orderPaymentStatus => 'حالة الدفع';

  @override
  String get ordersTagPending => 'قيد الانتظار';

  @override
  String get orderTypeDeliverNow => 'توصيل الآن';

  @override
  String get scheduleTitle => 'جدولة التوصيل';

  @override
  String scheduleDeliveryDays(int count) {
    return 'أيام التوصيل (بحد أقصى $count أيام)';
  }

  @override
  String get scheduleDeliveryPeriod => 'مدة التوصيل';

  @override
  String get scheduleStartDate => 'تاريخ البدء';

  @override
  String get scheduleDeliverUntil => 'التوصيل حتى';

  @override
  String get scheduleSelect => 'اختر';

  @override
  String schedulePerWeek(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توصيلات أسبوعياً',
      one: 'توصيلة واحدة أسبوعياً',
    );
    return '$_temp0';
  }

  @override
  String schedulePerMonth(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توصيلات شهرياً',
      one: 'توصيلة واحدة شهرياً',
    );
    return '$_temp0';
  }

  @override
  String scheduleWeekdayCount(int count, String day) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count × $day',
    );
    return '$_temp0';
  }

  @override
  String scheduleDateCount(int count, String day) {
    return '$count × $day';
  }

  @override
  String scheduleAnd(String first, String second) {
    return '$first و$second';
  }

  @override
  String scheduleSummary(String count, String days, String from, String to) {
    return 'ستستلم $count توصيلات، كل $days من $from إلى $to';
  }

  @override
  String scheduleSummaryOpen(String days, String from) {
    return 'ستستلم التوصيلات كل $days من $from حتى تلغي';
  }

  @override
  String get scheduleNoFeb =>
      'يرجى ملاحظة أن شهر فبراير لا يحتوي على أيام بعد 28';

  @override
  String get scheduleNo31 => 'يرجى ملاحظة أن ليست كل الأشهر تحتوي على 31 يوماً';

  @override
  String scheduleMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أشهر',
      two: 'شهران',
      one: 'شهر واحد',
    );
    return '$_temp0';
  }

  @override
  String get scheduleCustomEnd => 'تاريخ انتهاء مخصص';

  @override
  String scheduleUntil(String period) {
    return 'حتى $period';
  }

  @override
  String get scheduleSlotTitle => 'وقت التوصيل';

  @override
  String scheduleWeekly(String days) {
    return 'أسبوعياً، $days';
  }

  @override
  String scheduleMonthly(String days) {
    return 'شهرياً، $days';
  }

  @override
  String get checkoutDeliverNow => 'توصيل الآن';

  @override
  String get checkoutDeliverNowHint => 'اختر تاريخ ووقت التوصيل';

  @override
  String get checkoutPaymentType => 'طريقة السداد';

  @override
  String get payTypeTitle => 'اختر طريقة السداد';

  @override
  String get payTypeAsYouGo => 'ادفع لكل توصيلة';

  @override
  String get payTypeAsYouGoBody =>
      'ادفع للتوصيلة القادمة فقط. سنرسل رابط دفع قبل كل توصيلة لاحقة.';

  @override
  String payTypeToday(String amount) {
    return '$amount اليوم';
  }

  @override
  String get payTypeUpfront => 'ادفع مقدماً';

  @override
  String get payTypeUpfrontBody =>
      'ادفع جميع التوصيلات خلال الأسابيع الأربعة القادمة، أو توصيلات الشهر القادم.';

  @override
  String payTypeUpfrontTotal(int count, String price, String total) {
    return '$count توصيلات × $price = $total';
  }

  @override
  String deliveryPayBefore(String when) {
    return 'ادفع قبل $when لاستلام طلبك';
  }

  @override
  String get upfrontCardTitle => 'ادفع مقدماً';

  @override
  String get cancelDeliveryTitle => 'إلغاء التوصيل';

  @override
  String get cancelDeliveryAll => 'إلغاء جميع التوصيلات';

  @override
  String get cancelDeliverySelect => 'اختر التاريخ';

  @override
  String get cancelDeliveryNote => 'سيتم إلغاء التوصيلات في التواريخ المختارة';

  @override
  String get pauseDeliveryTitle => 'إيقاف التوصيل مؤقتاً';

  @override
  String get pauseDateRange => 'فترة الإيقاف';

  @override
  String get pauseRecovery => 'اختر طريقة التعويض';

  @override
  String get pauseRefund => 'أريد استرداد المبلغ';

  @override
  String get pauseRefundAmount => 'مبلغ الاسترداد';

  @override
  String pauseRefundLine(int count, String price) {
    return '$count توصيلات × $price';
  }

  @override
  String get pauseExtend => 'تمديد التواريخ';

  @override
  String get pauseExtendedTill => 'ممتد حتى';

  @override
  String get pauseSummary => 'الملخص';

  @override
  String pauseRangeNote(String from, String to) {
    return 'سيتم إيقاف جميع توصيلاتك من $from إلى $to';
  }

  @override
  String get pauseRangeTitle => 'اختر فترة الإيقاف';

  @override
  String get pauseStart => 'تاريخ البدء';

  @override
  String get pauseEnd => 'تاريخ الانتهاء';

  @override
  String pauseDaysValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count أيام',
      one: 'يوم واحد',
    );
    return '$_temp0';
  }

  @override
  String get resumeTitle => 'اختر تاريخ الاستئناف';

  @override
  String get resumeFrom => 'من';

  @override
  String get resumeTo => 'إلى';

  @override
  String resumeNote(String from, String to) {
    return 'سيتم استئناف جميع توصيلاتك من $from إلى $to';
  }

  @override
  String get paymentCancelledTitle => 'تم إلغاء الدفع';

  @override
  String scheduleSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count توصيلات',
      one: 'توصيلة واحدة',
    );
    return '$_temp0';
  }

  @override
  String get splashTagline => 'بطل وراء كل قطرة';

  @override
  String get homeCurrentTime => 'الوقت الحالي';

  @override
  String get homeTodaysOrders => 'طلبات اليوم';

  @override
  String ordersFilterCount(String label, int count) {
    return '$label ($count)';
  }

  @override
  String get orderHistoryTitle => 'سجل الطلبات';

  @override
  String get ordersSearchHint => 'ابحث عن طلب';

  @override
  String get ordersAllOrders => 'كل الطلبات';

  @override
  String get ordersFilterReassign => 'إعادة التعيين';

  @override
  String get ordersDateRange => 'نطاق التاريخ';

  @override
  String get ordersDateLast30Days => 'آخر 30 يومًا';

  @override
  String get ordersDateLast6Months => 'آخر 6 أشهر';

  @override
  String get ordersDateLastYear => 'السنة الماضية';

  @override
  String get pastOrdersTitle => 'الطلبات السابقة';

  @override
  String get reassignedTitle => 'المعاد تعيينها';

  @override
  String get orderStatusNewOrder => 'طلب جديد';

  @override
  String get orderStatusOrderPicked => 'تم الاستلام';

  @override
  String get orderStatusDropOff => 'التسليم';

  @override
  String get orderStatusReassigned => 'أعيد تعيينه';

  @override
  String orderNumber(String number) {
    return '#$number';
  }

  @override
  String get paymentPaid => 'مدفوع';

  @override
  String get paymentPending => 'قيد الانتظار';

  @override
  String get paymentStatusLabel => 'حالة الدفع';

  @override
  String get orderDeliveryDateTime => 'تاريخ ووقت التوصيل';

  @override
  String get orderAssignedOn => 'تاريخ الإسناد';

  @override
  String get orderDetailTitle => 'تفاصيل الطلب';

  @override
  String get orderTotalItems => 'إجمالي المنتجات';

  @override
  String orderItemPack(int volume, int bottles) {
    return '$volume مل × $bottles عبوات';
  }

  @override
  String orderItemQuantity(String quantity) {
    return 'الكمية $quantity';
  }

  @override
  String get orderDeliveryLocation => 'موقع التوصيل';

  @override
  String get orderLocationPhotos => 'سيساعدك هذا على الوصول أسرع!';

  @override
  String get orderCustomerDetail => 'بيانات العميل';

  @override
  String get orderSpecialInstruction => 'تعليمات خاصة';

  @override
  String get orderReasonReassign => 'سبب إعادة التعيين';

  @override
  String get orderReasonFail => 'سبب فشل التوصيل';

  @override
  String get orderReassign => 'إعادة تعيين';

  @override
  String get orderContactSupport => 'تواصل مع الدعم';

  @override
  String get orderFailDelivery => 'فشل التوصيل';

  @override
  String get orderMarkDelivered => 'تأكيد التوصيل';

  @override
  String get orderCashCollected => 'تم استلام النقد';

  @override
  String get orderTotalAmount => 'المبلغ الإجمالي';

  @override
  String get orderDirections => 'الاتجاهات';

  @override
  String get orderCallCustomer => 'اتصل بالعميل';

  @override
  String get reassignTitle => 'إعادة تعيين الطلب';

  @override
  String get reassignMessage =>
      'هل أنت متأكد أنك تريد إعادة تعيين هذا الطلب لسائق آخر؟';

  @override
  String get reassignReasonHint => 'اكتب السبب';

  @override
  String get commonConfirm => 'تأكيد';

  @override
  String get commonSubmit => 'إرسال';

  @override
  String get failDeliveryTitle => 'فشل التوصيل';

  @override
  String get failDeliveryPrompt => 'اختر سبب فشل هذا التوصيل.';

  @override
  String get failReasonCustomerNotAvailable => 'العميل غير متوفر';

  @override
  String get failReasonWrongAddress => 'العنوان المقدم خاطئ';

  @override
  String get failReasonAccessDenied => 'تم رفض الدخول / لا يوجد مدخل';

  @override
  String get failReasonPackageDamaged => 'الطرد تالف';

  @override
  String get failReasonRefused => 'رفض الاستلام';

  @override
  String get failReasonOther => 'أخرى';

  @override
  String get failReasonHint => 'السبب';

  @override
  String get profileMyDetails => 'بياناتي';

  @override
  String get profilePrivacyPolicies => 'الخصوصية والسياسات';

  @override
  String get faqsTitle => 'الأسئلة الشائعة';

  @override
  String get faqsSubtitle => 'الأسئلة المتكررة';

  @override
  String get faqsEmpty => 'لا توجد أسئلة بعد';

  @override
  String get detailsEmail => 'البريد الإلكتروني';

  @override
  String get detailsMobile => 'رقم الجوال';

  @override
  String get detailsZone => 'المنطقة';

  @override
  String get detailsRouteId => 'رقم المسار';

  @override
  String get detailsVehicleNumber => 'رقم المركبة';

  @override
  String get failReasonRequired => 'اختر سبب فشل هذا التوصيل.';
}
