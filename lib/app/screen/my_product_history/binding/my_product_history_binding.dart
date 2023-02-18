import 'package:get/get.dart';
import 'package:rentx/app/screen/my_product_history/controller/my_product_history_controller.dart';

class MyProductHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductHistoryController>(
        () => MyProductHistoryController(Get.find()));
  }
}
