import 'package:get/get.dart';
import 'package:musium/res/routes/routes_name.dart';
import 'package:musium/view/authentication/ask_user.dart';
import 'package:musium/view/get_started.dart';
import 'package:musium/view/mainscreen/home_screen.dart';
import 'package:musium/view/splash_screen.dart';

class AppRoutes {
  static appRoute() =>
      [
        GetPage(
            name: RouteName().splashScreen,
            page: () => const SplashScreen()),
        GetPage(
            name: RouteName().getStarted,
            page: () => const GetStarted()),
        GetPage(
            name: RouteName().askUser,
            page: () => const AskUser()),
        GetPage(
            name: RouteName().homeScreen,
            page: () => const HomeScreen()),
      ];
}