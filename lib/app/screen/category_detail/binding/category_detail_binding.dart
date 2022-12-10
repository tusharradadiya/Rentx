import 'package:get/get.dart';
import 'package:rentx/app/screen/category_detail/controller/category_detail_controller.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryDetailController>(() => CategoryDetailController());
  }
}
