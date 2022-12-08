import 'package:get/get.dart';
import 'package:rentx/app/screen/add_product/binding/add_product_binding.dart';
import 'package:rentx/app/screen/add_product/view/add_product_view.dart';
import 'package:rentx/app/screen/home/binding/home_binding.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';
import 'package:rentx/app/screen/login/binding/login_binding.dart';
import 'package:rentx/app/screen/login/view/login_screen.dart';
import 'package:rentx/app/screen/sign_up/binding/sign_up_binding.dart';
import 'package:rentx/app/screen/sign_up/view/sign_up_screen.dart';
import 'package:rentx/app/screen/splash_screen/binding/splash_screen_binding.dart';
import 'package:rentx/app/screen/splash_screen/view/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.addProduct,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
  ];
}
