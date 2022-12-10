import 'package:get/get.dart';
import 'package:rentx/app/screen/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
