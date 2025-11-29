import 'package:get/get.dart';
import '../view/pet_owner/auth/Signup_screen.dart';
import '../view/pet_owner/auth/forgot_password_screen.dart';
import '../view/pet_owner/auth/login_screen.dart';
import '../view/pet_owner/auth/new_password_screen.dart';
import '../view/pet_owner/auth/otp_screen.dart';
import '../view/pet_owner/bookings/booking_screen.dart';
import '../view/pet_owner/bottom_nav/bottom_nav.dart';
import '../view/pet_owner/inbox/inbox_screen.dart';
import '../view/pet_owner/profile/pet_profile.dart';
import '../view/pet_owner/profile/profile_screen.dart';
import '../view/pet_owner/services/services_screen.dart';
import '../view/pet_sitter/auth/forgot_password_screen.dart';
import '../view/pet_sitter/auth/new_password_screen.dart';
import '../view/pet_sitter/auth/otp_screen.dart';
import '../view/pet_sitter/auth/sitter_login_screen.dart';
import '../view/pet_sitter/auth/sitter_signup_screen.dart';
import '../view/pet_sitter/bookings/booking_screen.dart';
import '../view/pet_sitter/bottom_nav/sitter_bottom_nav.dart';
import '../view/pet_sitter/create_service/Boarding.dart';
import '../view/pet_sitter/create_service/DogWalking.dart';
import '../view/pet_sitter/create_service/create_service.dart';
import '../view/pet_sitter/create_service/dog_day_care.dart';
import '../view/pet_sitter/home/home_screen.dart';
import '../view/pet_sitter/profile/profile_screen.dart';
import '../view/splash/onboarding_screen.dart';
import '../view/splash/sitter_onboarding_screen.dart';
import '../view/splash/splash_screen.dart';





class AppRoutes {

  //Owner
  static const String bottomNavScreen = "/bottom_nav";
  static const String splashScreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String loginScreen = "/login_screen";
  static const String signUpScreen = "/Signup_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String oTPScreen = "/otp_screen";
  static const String newPasswordScreen = "/new_password_screen";
  static const String servicesScreen = "/services_screen";
  static const String inboxScreen = "/inbox_screen";
  static const String bookingsScreen = "/booking_screen";
  static const String profileScreen = "/profile_screen";
  static const String petProfileScreen = "/pet_profile";

  //Sitter
  static const String sitterLoginScreen = "/sitter_login_screen";
  static const String sitterSignUpScreen = "/sitter_signup_screen";
  static const String sitterForgotPasswordScreen = "/forgot_password_screen";
  static const String sitterOTPScreen = "/otp_screen";
  static const String sitterNewPasswordScreen = "/new_password_screen";
  static const String sitterOnboardingScreen = "/sitter_onboarding_screen";
  static const String sitterBottomNavScreen = "/sitter_bottom_nav";
  static const String sitterHomeScreen = "/home_screen";
  static const String createService = "/create_service";
  static const String sitterBookingsScreen = "/booking_screen";
  static const String bording = "/Boarding";
  static const String dogwalk = "/DogWalking";
  static const String dogDay = "/dog_day_care";
  static const String sitterProfileScreen = "/profile_screen";

  static List<GetPage> routes = [

    //Owner
    GetPage(name: bottomNavScreen, page: () => BottomNavScreen()),
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page: () => SignUpScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: oTPScreen, page: () => OTPScreen()),
    GetPage(name: newPasswordScreen, page: () => NewPasswordScreen()),
    GetPage(name: servicesScreen, page: () => ServicesScreen()),
    GetPage(name: inboxScreen, page: () => InboxScreen()),
    GetPage(name: bookingsScreen, page: () => BookingsScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: petProfileScreen, page: () => PetProfileScreen()),

    // Sitter
    GetPage(name: sitterLoginScreen, page: () => SitterLoginScreen()),
    GetPage(name: sitterSignUpScreen, page: () => SitterSignUpScreen()),
    GetPage(name: sitterForgotPasswordScreen, page: () => SitterForgotPasswordScreen()),
    GetPage(name: sitterOTPScreen, page: () => SitterOTPScreen()),
    GetPage(name: sitterNewPasswordScreen, page: () => SitterNewPasswordScreen()),
    GetPage(name: sitterOnboardingScreen, page: () => SitterOnboardingScreen()),
    GetPage(name: sitterBottomNavScreen, page: () => SitterBottomNavScreen()),
    GetPage(name: sitterHomeScreen, page: () => SitterHomeScreen()),
    GetPage(name: createService, page: () => CreateService()),
    GetPage(name: sitterBookingsScreen, page: () => SitterBookingsScreen()),
    GetPage(name: bording, page: () => BoardingSetupScreen()),
    GetPage(name: dogwalk, page: () => DogWalkingSetupScreen()),
    GetPage(name: dogDay, page: () => DoggyDayCareSetupScreen()),
    GetPage(name: sitterProfileScreen, page: () => SitterProfileScreen()),

  ];
}