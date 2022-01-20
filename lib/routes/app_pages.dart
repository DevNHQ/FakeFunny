import 'package:fake_funny/pages/dash_board/dash_board_binding.dart';
import 'package:fake_funny/pages/dash_board/dash_board_page.dart';
import 'package:fake_funny/pages/language/language_binding.dart';
import 'package:fake_funny/pages/language/language_page.dart';
import 'package:fake_funny/pages/splash/splash_binding.dart';
import 'package:fake_funny/pages/splash/splash_page.dart';
import 'package:fake_funny/routes/app_routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppPages {
  static const duration = 1000;
  static var pages = [
    GetPage(
        name: AppRoutes.splash,
        page: () => const SplashPage(),
        binding: SplashBinding(),
        transition: Transition.topLevel,
        transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguagePage(),
      binding: LanguageBinding(),
      transition: Transition.topLevel,
      transitionDuration: const Duration(milliseconds: duration),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardPage(),
      binding: DashBoardBinding(),
      transition: Transition.topLevel,
      transitionDuration: const  Duration(milliseconds: duration),
    ),
  ];
}
