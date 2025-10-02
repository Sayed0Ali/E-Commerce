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
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @personal_information.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personal_information;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shipping_address;

  /// No description provided for @payment_method.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get payment_method;

  /// No description provided for @order_history.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get order_history;

  /// No description provided for @contact_us.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contact_us;

  /// No description provided for @support_information.
  ///
  /// In en, this message translates to:
  /// **'Support & Information'**
  String get support_information;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms_conditions;

  /// No description provided for @account_management.
  ///
  /// In en, this message translates to:
  /// **'Account & Management'**
  String get account_management;

  /// No description provided for @change_password.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get change_password;

  /// No description provided for @change_language.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get change_language;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @latest_products.
  ///
  /// In en, this message translates to:
  /// **'Latest Products'**
  String get latest_products;

  /// No description provided for @suggested_products.
  ///
  /// In en, this message translates to:
  /// **'Suggested Products'**
  String get suggested_products;

  /// No description provided for @brands.
  ///
  /// In en, this message translates to:
  /// **'Brands'**
  String get brands;

  /// No description provided for @see_all.
  ///
  /// In en, this message translates to:
  /// **'SEE ALL'**
  String get see_all;

  /// No description provided for @fashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get fashion;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get sign_up;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @enter_full_name.
  ///
  /// In en, this message translates to:
  /// **'Enter your Full Name'**
  String get enter_full_name;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email_address;

  /// No description provided for @enter_email_address.
  ///
  /// In en, this message translates to:
  /// **'Enter your E-mail address'**
  String get enter_email_address;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enter_password.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enter_password;

  /// No description provided for @create_account.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get create_account;

  /// No description provided for @sign_up_with_google.
  ///
  /// In en, this message translates to:
  /// **'Sign Up with Google'**
  String get sign_up_with_google;

  /// No description provided for @verification_code.
  ///
  /// In en, this message translates to:
  /// **'Verification Code'**
  String get verification_code;

  /// No description provided for @email_verification.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get email_verification;

  /// No description provided for @enter_verification_code.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit verification code sent to your email address.'**
  String get enter_verification_code;

  /// No description provided for @resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resend_code;

  /// No description provided for @proceed.
  ///
  /// In en, this message translates to:
  /// **'Proceed'**
  String get proceed;

  /// No description provided for @my_cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get my_cart;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @voucher_code.
  ///
  /// In en, this message translates to:
  /// **'Voucher Code'**
  String get voucher_code;

  /// No description provided for @order_finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get order_finished;

  /// No description provided for @order_estimated_time.
  ///
  /// In en, this message translates to:
  /// **'Estimated time:'**
  String get order_estimated_time;

  /// No description provided for @no_ongoing_order.
  ///
  /// In en, this message translates to:
  /// **'No ongoing order.'**
  String get no_ongoing_order;

  /// No description provided for @no_ongoing_order_desc.
  ///
  /// In en, this message translates to:
  /// **'We currently don’t have any active orders in progress. Feel free to explore our products and place a new order.'**
  String get no_ongoing_order_desc;

  /// No description provided for @explore_categories.
  ///
  /// In en, this message translates to:
  /// **'Explore Categories'**
  String get explore_categories;

  /// No description provided for @cart_empty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cart_empty;

  /// No description provided for @noCompletedOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'No Completed order.'**
  String get noCompletedOrderTitle;

  /// No description provided for @noCompletedOrderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We don\'t have any past orders that have been completed. Start shopping now and create your first order with us.'**
  String get noCompletedOrderSubtitle;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone Number'**
  String get enter_phone_number;

  /// No description provided for @street_address.
  ///
  /// In en, this message translates to:
  /// **'Street Address'**
  String get street_address;

  /// No description provided for @enter_address.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Address'**
  String get enter_address;

  /// No description provided for @postal_code.
  ///
  /// In en, this message translates to:
  /// **'Postal Code'**
  String get postal_code;

  /// No description provided for @enter_postal_code.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Postal Code'**
  String get enter_postal_code;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @select_province.
  ///
  /// In en, this message translates to:
  /// **'Select Province'**
  String get select_province;

  /// No description provided for @select_city.
  ///
  /// In en, this message translates to:
  /// **'Select City'**
  String get select_city;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @enter_message.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Message'**
  String get enter_message;

  /// No description provided for @cash_on_delivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get cash_on_delivery;

  /// No description provided for @electronic_wallet.
  ///
  /// In en, this message translates to:
  /// **'Electronic wallet'**
  String get electronic_wallet;

  /// No description provided for @s_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get s_continue;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @enter_new_password.
  ///
  /// In en, this message translates to:
  /// **'Enter New Password to change the password.'**
  String get enter_new_password;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @step_02_02.
  ///
  /// In en, this message translates to:
  /// **'02/02'**
  String get step_02_02;

  /// No description provided for @step_01_02.
  ///
  /// In en, this message translates to:
  /// **'01/02'**
  String get step_01_02;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @login_with_google.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get login_with_google;

  /// No description provided for @confirmation_email.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Email'**
  String get confirmation_email;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get dont_have_account;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgot_password;

  /// No description provided for @step_03_03.
  ///
  /// In en, this message translates to:
  /// **'03/03'**
  String get step_03_03;

  /// No description provided for @new_password_set.
  ///
  /// In en, this message translates to:
  /// **'New password set successfully'**
  String get new_password_set;

  /// No description provided for @new_password_success_message.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your password has been set successfully. Please proceed to the login screen to verify your account.'**
  String get new_password_success_message;

  /// No description provided for @step_02_03.
  ///
  /// In en, this message translates to:
  /// **'02/03'**
  String get step_02_03;

  /// No description provided for @step_01_03.
  ///
  /// In en, this message translates to:
  /// **'01/03'**
  String get step_01_03;

  /// No description provided for @create_password.
  ///
  /// In en, this message translates to:
  /// **'Create Password'**
  String get create_password;

  /// No description provided for @your_cart_is_empty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get your_cart_is_empty;

  /// No description provided for @order_info.
  ///
  /// In en, this message translates to:
  /// **'Order Info'**
  String get order_info;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @shipping_cost.
  ///
  /// In en, this message translates to:
  /// **'Shipping Cost'**
  String get shipping_cost;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @price_low_to_high.
  ///
  /// In en, this message translates to:
  /// **'Price (Low to High)'**
  String get price_low_to_high;

  /// No description provided for @price_high_to_low.
  ///
  /// In en, this message translates to:
  /// **'Price (High to Low)'**
  String get price_high_to_low;

  /// No description provided for @a_to_z.
  ///
  /// In en, this message translates to:
  /// **'A-Z'**
  String get a_to_z;

  /// No description provided for @z_to_a.
  ///
  /// In en, this message translates to:
  /// **'Z-A'**
  String get z_to_a;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @all_colors.
  ///
  /// In en, this message translates to:
  /// **'All 4 Colors'**
  String get all_colors;

  /// No description provided for @verification_email.
  ///
  /// In en, this message translates to:
  /// **'Verification Email'**
  String get verification_email;

  /// No description provided for @enter_verification_code_sent.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to your email'**
  String get enter_verification_code_sent;

  /// No description provided for @route_not_found.
  ///
  /// In en, this message translates to:
  /// **'Route not found!'**
  String get route_not_found;

  /// No description provided for @no_new_notifications.
  ///
  /// In en, this message translates to:
  /// **'No new notifications'**
  String get no_new_notifications;

  /// No description provided for @our_policy.
  ///
  /// In en, this message translates to:
  /// **'1 - Our Policy.'**
  String get our_policy;

  /// No description provided for @privacy_policy_content.
  ///
  /// In en, this message translates to:
  /// **'At QuickMart, we are committed to protecting the privacy and security of our users personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard the information obtained through our e-commerce app. By using QuickMart, you consent to the practices described in this policy.'**
  String get privacy_policy_content;

  /// No description provided for @terms_conditions_title.
  ///
  /// In en, this message translates to:
  /// **'1-Terms & Conditions'**
  String get terms_conditions_title;

  /// No description provided for @terms_conditions_content.
  ///
  /// In en, this message translates to:
  /// **'Welcome to QuickMart! These Terms and Conditions (\"Terms\") govern your use of our e-commerce app. By accessing or using QuickMart, you agree to be bound by these Terms. Please read them carefully before proceeding.'**
  String get terms_conditions_content;

  /// No description provided for @voucher_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Voucher Code'**
  String get voucher_code_hint;

  /// No description provided for @t_shirt.
  ///
  /// In en, this message translates to:
  /// **'T-shirt'**
  String get t_shirt;

  /// No description provided for @shirt.
  ///
  /// In en, this message translates to:
  /// **'Shirt'**
  String get shirt;

  /// No description provided for @pants.
  ///
  /// In en, this message translates to:
  /// **'Pants'**
  String get pants;

  /// No description provided for @jacket.
  ///
  /// In en, this message translates to:
  /// **'Jacket'**
  String get jacket;

  /// No description provided for @outfit.
  ///
  /// In en, this message translates to:
  /// **'Outfit'**
  String get outfit;

  /// No description provided for @shoes.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoes;

  /// No description provided for @cool_t_shirt.
  ///
  /// In en, this message translates to:
  /// **'Cool T-shirt'**
  String get cool_t_shirt;

  /// No description provided for @denim_jacket.
  ///
  /// In en, this message translates to:
  /// **'Denim Jacket'**
  String get denim_jacket;

  /// No description provided for @sport_shoes.
  ///
  /// In en, this message translates to:
  /// **'Sport Shoes'**
  String get sport_shoes;

  /// No description provided for @classic_pants.
  ///
  /// In en, this message translates to:
  /// **'Classic Pants'**
  String get classic_pants;

  /// No description provided for @cotton_t_shirt.
  ///
  /// In en, this message translates to:
  /// **'Cotton T-shirt'**
  String get cotton_t_shirt;

  /// No description provided for @sport_t_shirt.
  ///
  /// In en, this message translates to:
  /// **'Sport T-shirt'**
  String get sport_t_shirt;

  /// No description provided for @casual_t_shirt.
  ///
  /// In en, this message translates to:
  /// **'Casual T-shirt'**
  String get casual_t_shirt;

  /// No description provided for @formal_shirt.
  ///
  /// In en, this message translates to:
  /// **'Formal Shirt'**
  String get formal_shirt;

  /// No description provided for @casual_shirt.
  ///
  /// In en, this message translates to:
  /// **'Casual Shirt'**
  String get casual_shirt;

  /// No description provided for @office_shirt.
  ///
  /// In en, this message translates to:
  /// **'Office Shirt'**
  String get office_shirt;

  /// No description provided for @jeans.
  ///
  /// In en, this message translates to:
  /// **'Jeans'**
  String get jeans;

  /// No description provided for @cargo_pants.
  ///
  /// In en, this message translates to:
  /// **'Cargo Pants'**
  String get cargo_pants;

  /// No description provided for @formal_pants.
  ///
  /// In en, this message translates to:
  /// **'Formal Pants'**
  String get formal_pants;

  /// No description provided for @winter_jacket.
  ///
  /// In en, this message translates to:
  /// **'Winter Jacket'**
  String get winter_jacket;

  /// No description provided for @leather_jacket.
  ///
  /// In en, this message translates to:
  /// **'Leather Jacket'**
  String get leather_jacket;

  /// No description provided for @sport_jacket.
  ///
  /// In en, this message translates to:
  /// **'Sport Jacket'**
  String get sport_jacket;

  /// No description provided for @casual_outfit.
  ///
  /// In en, this message translates to:
  /// **'Casual Outfit'**
  String get casual_outfit;

  /// No description provided for @sport_outfit.
  ///
  /// In en, this message translates to:
  /// **'Sport Outfit'**
  String get sport_outfit;

  /// No description provided for @summer_outfit.
  ///
  /// In en, this message translates to:
  /// **'Summer Outfit'**
  String get summer_outfit;

  /// No description provided for @casual_shoes.
  ///
  /// In en, this message translates to:
  /// **'Casual Shoes'**
  String get casual_shoes;

  /// No description provided for @formal_shoes.
  ///
  /// In en, this message translates to:
  /// **'Formal Shoes'**
  String get formal_shoes;

  /// No description provided for @egp_currency.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp_currency;

  /// No description provided for @usd_currency.
  ///
  /// In en, this message translates to:
  /// **'\\\$'**
  String get usd_currency;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'cart'**
  String get cart;

  /// No description provided for @shehab.
  ///
  /// In en, this message translates to:
  /// **'shehab'**
  String get shehab;

  /// No description provided for @sayed_gmail.
  ///
  /// In en, this message translates to:
  /// **'sayed@gmail.com'**
  String get sayed_gmail;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @select_payment_method.
  ///
  /// In en, this message translates to:
  /// **'Select Payment Method'**
  String get select_payment_method;

  /// No description provided for @pay_when_receive.
  ///
  /// In en, this message translates to:
  /// **'Pay when you receive your order'**
  String get pay_when_receive;

  /// No description provided for @pay_with_wallet.
  ///
  /// In en, this message translates to:
  /// **'Pay with your electronic wallet'**
  String get pay_with_wallet;

  /// No description provided for @continue_text.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continue_text;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get items;

  /// No description provided for @mobile_number.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobile_number;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @place_order.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get place_order;

  /// No description provided for @order_placed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Your order has been placed successfully'**
  String get order_placed_successfully;

  /// No description provided for @thank_you_message.
  ///
  /// In en, this message translates to:
  /// **'Thank you for choosing us! Feel free to continue shopping and explore our wide range of products. Happy Shopping!'**
  String get thank_you_message;

  /// No description provided for @continue_shopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continue_shopping;

  /// No description provided for @product_description.
  ///
  /// In en, this message translates to:
  /// **'Constructed with high-quality materials, this product ensures a comfortable and secure fit. The soft and flexible material is gentle on the skin, making it ideal for everyday use. Features include adjustable settings, durable construction, and a sleek modern design that complements any style.'**
  String get product_description;

  /// No description provided for @exploreProductsTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore a wide range of products'**
  String get exploreProductsTitle;

  /// No description provided for @exploreProductsDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore a wide range of products at your fingertips. my market offers an extensive collection to suit your needs.'**
  String get exploreProductsDesc;

  /// No description provided for @exclusiveOffersTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock exclusive offers and discounts'**
  String get exclusiveOffersTitle;

  /// No description provided for @exclusiveOffersDesc.
  ///
  /// In en, this message translates to:
  /// **'Get access to limited-time deals and special promotions available only to our valued customers.'**
  String get exclusiveOffersDesc;

  /// No description provided for @securePaymentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Safe and secure payments'**
  String get securePaymentsTitle;

  /// No description provided for @securePaymentsDesc.
  ///
  /// In en, this message translates to:
  /// **'QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.'**
  String get securePaymentsDesc;

  /// No description provided for @skipForNow.
  ///
  /// In en, this message translates to:
  /// **'Skip for now'**
  String get skipForNow;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @flash_sale.
  ///
  /// In en, this message translates to:
  /// **'Flash Sale'**
  String get flash_sale;

  /// No description provided for @wishlist_empty_title.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty'**
  String get wishlist_empty_title;

  /// No description provided for @wishlist_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap heart button to start saving your favorite items.'**
  String get wishlist_empty_subtitle;

  /// No description provided for @wishlist_empty_button.
  ///
  /// In en, this message translates to:
  /// **'Explore Categories'**
  String get wishlist_empty_button;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @resent_search.
  ///
  /// In en, this message translates to:
  /// **'RECENT SEARCH'**
  String get resent_search;
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
