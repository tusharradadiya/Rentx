part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.login;
  static const signUpScreen = _Paths.signUp;
  static const homeScreen = _Paths.HOME;
  static const addProductView = _Paths.addProduct;
}

abstract class _Paths {
  _Paths._();
  static const splashScreen = '/splash-screen';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const HOME = '/home';
  static const addProduct = '/add-product';
}
