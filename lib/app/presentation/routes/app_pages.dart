import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import '../modules/bindings.dart';
import '../modules/pages.dart';
import '../routes/app_routes.dart';

class AppPages {
  static final _transition = Transition.rightToLeft;
  static final _transitionDuration = const Duration(milliseconds: 400);
  static final _curve = Curves.fastOutSlowIn;
  static GetPage getPageConfig({required String name,required GetPageBuilder page, required  Bindings binding} ) {
    return GetPage(
        transition: _transition,
        transitionDuration: _transitionDuration,
        curve: _curve,
        name: name,
        page: page,
        binding: binding);
  }

  static final List<GetPage> pages = [
    getPageConfig(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding()),
    getPageConfig(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    getPageConfig(
        name: AppRoutes.MENU,
        page: () => MenuPrincipalPage(),
        binding: MenuPrincipalBinding()),

  ];
}
