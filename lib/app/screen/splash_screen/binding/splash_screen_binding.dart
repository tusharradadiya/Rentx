import 'package:get/get.dart';
import 'package:rentx/app/screen/splash_screen/controller/splash_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(Get.find()));
  }
}
