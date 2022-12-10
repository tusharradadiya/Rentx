import 'package:get/get.dart';
import 'package:rentx/app/screen/my_product/controller/my_product_controller.dart';

class MyProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductController>(() => MyProductController(Get.find()));
  }
}
