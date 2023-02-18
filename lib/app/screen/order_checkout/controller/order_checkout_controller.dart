import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';

class OrderCheckoutController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;
  RxMap productMap = {}.obs;
  ProductModel? productModel;
  RxString totalDays = ''.obs;
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> orderKey = GlobalKey();

  OrderCheckoutController(this.localRepositoryInterFace);

  @override
  void onInit() {
    name.text = localRepositoryInterFace.getUser().username;
    productModel = Get.arguments[0];
    totalDays.value = Get.arguments[1];
    super.onInit();
  }
}
