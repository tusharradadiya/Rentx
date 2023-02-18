import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';
import 'package:rentx/app/screen/popular_product/controller/popular_controller.dart';

class PopularProductView extends GetWidget<PopularProductController> {
  const PopularProductView({super.key});

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
          title: const Text('Popular Product'),
          leading: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.homeScreen);
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: Obx(() => controller.isDataFetch.value
            ? Padding(
                padding: EdgeInsets.only(
                    left: ScreenSize.screenSize.width * 0.03,
                    right: ScreenSize.screenSize.width * 0.03,
                    top: 15),
                child: Obx(
                  () => GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.8,
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0),
                      itemBuilder: (context, index) {
                        return productCard(
                          controller.productList[index].productImage[0],
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
                ))
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )),
      ),
    );
  }
}
