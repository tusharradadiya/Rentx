import 'package:get/get.dart';
import 'package:rentx/app/model/product_model.dart';

class ProductDetailController extends GetxController
{

  ProductModel? productModel;

    @override
  void onInit() {
      print(Get.arguments.runtimeType);
      productModel=Get.arguments;
    super.onInit();
  }
}