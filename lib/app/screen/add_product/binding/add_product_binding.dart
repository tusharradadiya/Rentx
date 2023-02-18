import 'package:get/instance_manager.dart';
import 'package:rentx/app/screen/add_product/controller/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(() => AddProductController(Get.find()));
  }
}
