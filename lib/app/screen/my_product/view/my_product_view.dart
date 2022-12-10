import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';
import 'package:rentx/app/screen/my_product/controller/my_product_controller.dart';

class MyProductView extends GetWidget<MyProductController> {
  const MyProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('My Product'),
          leading: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.homeScreen);
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(
              () => GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return productCard(
                      controller.productList[index].productImage,
                      controller.productList[index].productName,
                      controller.productList[index].location,
                      controller.productList[index].price,
                      controller.productList[index].rating,
                      () {
                        Get.toNamed(Routes.productDetailView,
                            arguments: controller.productList[index]);
                      },
                    );
                  }),
            )),
      ),
    );
  }
}
