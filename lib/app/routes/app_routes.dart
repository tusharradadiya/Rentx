// ignore_for_file: constant_identifier_names

part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Paths.splashScreen;
  static const loginScreen = _Paths.login;
  static const signUpScreen = _Paths.signUp;
  static const homeScreen = _Paths.HOME;
  static const addProductView = _Paths.addProduct;
  static const popularProductView = _Paths.popularProduct;
  static const productDetailView = _Paths.productDetail;
  static const categoryDetailView = _Paths.categoryDetail;
  static const myProductView = _Paths.myProduct;
  static const orderChekoutView = _Paths.orderCheckout;
  static const paymentView = _Paths.paymentView;
  static const orderSuccesfullyView = _Paths.orderSuccesfully;
  static const orderhistoryView = _Paths.orderHistory;
  static const myProductHistoryView = _Paths.myProductHistory;
}

abstract class _Paths {
  _Paths._();
  static const splashScreen = '/splash-screen';
  static const login = '/login';
  static const signUp = '/sign-up';
  static const HOME = '/home';
  static const addProduct = '/add-product';
  static const popularProduct = '/popular-product';
  static const productDetail = '/product-detail';
  static const categoryDetail = '/category-detail';
  static const myProduct = '/my-product';
  static const orderCheckout = '/order-checkout';
  static const paymentView = '/payment-view';
  static const orderSuccesfully = '/order-succesfully';
  static const orderHistory = '/order-history';
  static const myProductHistory = '/my-product-history';
}
