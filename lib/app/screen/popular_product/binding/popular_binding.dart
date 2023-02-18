import 'package:get/get.dart';
import 'package:rentx/app/screen/popular_product/controller/popular_controller.dart';

class PopularProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PopularProductController>(
        () => PopularProductController(Get.find()));
  }
}
