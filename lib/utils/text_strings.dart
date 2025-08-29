import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

class TTextStrings {
  TTextStrings._(); // To avoid creating instances

  //onboarding screen titles and subtitles
  static const String onBoardingTitle1 = 'Discover Amazing Products';
  static const String onBoardingTitle2 = 'Find Your Style';
  static const String onBoardingTitle3 = 'Shop with Confidence';
  static const String onBoardingSubTitle1 =
      'Explore a wide range of products tailored for you.';
  static const String onBoardingSubTitle2 =
      'Find the perfect style that suits your personality.';
  static const String onBoardingSubTitle3 =
      'Shop with confidence and enjoy a seamless experience.';
  static const String onBoardingSkip = 'Skip';
  static const String onBoardingNext = 'Next';

  // -- Bottom Navigation Bar
  static const String home = 'Home';
  static const String categories = 'Categories';
  static const String cart = 'Cart';
  static const String profile = 'Profile';

  // -- Home Screen
  static const String welcomeMessage = 'Welcome to E-Commerce App!';
  static const String welcome = 'Welcome Back';

  //email verification screen
  static const String emailVerificationTitle = 'Verify Your Email Address';
  static const String emailVerificationSubtitle =
      'Congratulations! Your new accoint awaits; please verify your email address to get started and enjoy our shopping experience.`';

  static String loginText =
      "Discover Unlimited Choices And Unmatched Convenience";

  static String copyRightText = "${DateTime.timestamp().year} © AthleteArc.";

  static String resendEmail = "Resend Email";

  static String emailVerificationSuccess = "Your account successfully created!";

  static String emailVerificationSuccessSubtitle =
      "Yayyy!,Your email has been verified successfully ,You're all set to go ! Explore and enjoy the seamless shopping experience with us.";

  static String forgotPasswordemailVerificationTitle =
      "Reset Password Email Sent!";

  static String forgotPasswordemailVerificationSubTitle =
      "We value your privacy and security so have sent a password reset email to your registered email address. Please check your inbox and follow the instructions to reset your password.";

  static List<String> settingsOptions = [
    'My Addresses',
    'My Cart',
    'My Orders',
    'Bank Details',
    'My Coupons',
    'Notifications',
    'Privacy Policy',
    'Logout'
  ];
  static const List<IconData> settingsIcons = [
    // iconsax icons
    Iconsax.safe_home,
    Iconsax.shopping_cart,
    Iconsax.bag,
    Iconsax.bank,
    Iconsax.wallet4,
    Iconsax.notification,
    Iconsax.shield,
    Iconsax.logout
  ];

  static var settingsSubtitles = [
    'Manage your addresses',
    'View and manage your cart',
    'Track your orders',
    'Manage your bank details',
    'View and manage your coupons',
    'View notifications',
    'Read our privacy policy',
    'Logout from your account'
  ];

  static var appSettingsOptions = [
    'Dark Mode',
    'Notifications',
    'Safe Mode',
    'Location',
  ];
  static const List<IconData> appSettingsIcons = [
    Iconsax.moon,
    Iconsax.notification,
    Iconsax.shield,
    Iconsax.location
  ];
}
