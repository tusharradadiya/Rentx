// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:rentx/app/screen/add_product/binding/add_product_binding.dart';
import 'package:rentx/app/screen/add_product/view/add_product_view.dart';
import 'package:rentx/app/screen/category_detail/binding/category_detail_binding.dart';
import 'package:rentx/app/screen/category_detail/view/category_detail_view.dart';
import 'package:rentx/app/screen/home/binding/home_binding.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';
import 'package:rentx/app/screen/login/binding/login_binding.dart';
import 'package:rentx/app/screen/login/view/login_screen.dart';
import 'package:rentx/app/screen/my_product/binding/my_product_binding.dart';
import 'package:rentx/app/screen/my_product/view/my_product_view.dart';
import 'package:rentx/app/screen/my_product_history/binding/my_product_history_binding.dart';
import 'package:rentx/app/screen/my_product_history/view/my_product_history_view.dart';
import 'package:rentx/app/screen/order_checkout/binding/order_checkout_binding.dart';
import 'package:rentx/app/screen/order_checkout/view/order_checkout_view.dart';
import 'package:rentx/app/screen/order_history/binding/order_history_binding.dart';
import 'package:rentx/app/screen/order_history/view/order_history_view.dart';
import 'package:rentx/app/screen/payment/binding/payment_binding.dart';
import 'package:rentx/app/screen/payment/view/order_siuccessfully.dart';
import 'package:rentx/app/screen/payment/view/payment_view.dart';
import 'package:rentx/app/screen/popular_product/binding/popular_binding.dart';
import 'package:rentx/app/screen/popular_product/view/popular_product.dart';
import 'package:rentx/app/screen/product_detail/binding/product_detail_binding.dart';
import 'package:rentx/app/screen/product_detail/view/product_detail_view.dart';
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
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.addProduct,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.popularProduct,
      page: () => const PopularProductView(),
      binding: PopularProductBinding(),
    ),
    GetPage(
      name: _Paths.productDetail,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.categoryDetail,
      page: () => const CategoryDetailView(),
      binding: CategoryDetailBinding(),
    ),
    GetPage(
      name: _Paths.myProduct,
      page: () => const MyProductView(),
      binding: MyProductBinding(),
    ),
    GetPage(
      name: _Paths.orderCheckout,
      page: () => const OrderCheckoutView(),
      binding: OrderCheckoutBinding(),
    ),
    GetPage(
      name: _Paths.paymentView,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.orderSuccesfully,
      page: () => const OrderSuccesfullyView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.orderHistory,
      page: () => const OrderHistoryView(),
      binding: OrderHistoryBinding(),
    ),
    GetPage(
      name: _Paths.myProductHistory,
      page: () => MyProductHistoryView(),
      binding: MyProductHistoryBinding(),
    )
  ];
}
