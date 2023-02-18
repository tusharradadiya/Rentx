import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentx/app/model/product_model.dart';

class ProductDetailController extends GetxController {
  ProductModel? productModel;
  TextEditingController totalDayController = TextEditingController();
  RxBool isDataFetch = false.obs;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void onInit() {
    productModel = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => isDataFetch.value = true);
    super.onReady();
  }
}
