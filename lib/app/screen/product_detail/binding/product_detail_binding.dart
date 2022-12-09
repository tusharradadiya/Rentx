import 'package:get/get.dart';
import 'package:rentx/app/screen/product_detail/controller/product_detail_controller.dart';

class ProductDetailBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
  }

}