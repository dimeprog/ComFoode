import 'package:comfoode/views/sign%20up/signup.dart';
import 'package:comfoode/views/verification/verification.dart';
import 'package:get/get.dart';

import '../../views/Home/home_view.dart';
import '../../views/login/login_view.dart';
import '../../views/onboardingview/onboarding_view.dart';
import '../../views/splash/splash_view.dart';
import '../../views/sucessfull/sucessful_view.dart';

class RouteManager {
  static const String splashRoute = '/';
  static const String onBoardRoute = '/onboard';
  static const String onLoginRoute = '/login';
  static const String onSignUpRoute = '/sign-up';

  static const String onRegisterSuccessRoute = '/register_sucess';
  static const String onHomeRoute = '/home';

  static const String onVerificationRoute = '/verification_Expired';

  //  route functions
  static String goToOnboardingRoute() => onBoardRoute;
  static String goTosplashRoute() => splashRoute;
  static String goToLoginRoute() => onLoginRoute;
  static String goToSignUpRoute() => onSignUpRoute;

  static String goToRegSuccesRoute() => onRegisterSuccessRoute;
  static String goToHomeRoute() => onHomeRoute;

  static String goToVerificationRoute() => onVerificationRoute;

// list of route
  static List<GetPage> routes = [
    GetPage(
      name: splashRoute,
      page: () => SplashView(),
    ),
    GetPage(
      name: onBoardRoute,
      page: () => OnBoardingView(),
    ),
    GetPage(
      name: onLoginRoute,
      page: () => LoginView(),
    ),
    GetPage(
      name: onSignUpRoute,
      page: () => SignUpView(),
    ),
    GetPage(
      name: onRegisterSuccessRoute,
      page: () => SucessfulView(),
    ),
    GetPage(
      name: onHomeRoute,
      page: () => HomeView(),
    ),
    GetPage(
      name: onVerificationRoute,
      page: () => VerificationView(),
    ),
  ];
}
