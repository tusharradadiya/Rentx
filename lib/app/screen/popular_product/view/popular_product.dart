import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';
import 'package:rentx/app/screen/popular_product/controller/popular_controller.dart';

class PopularProductView extends GetWidget<PopularProductController> {
  const PopularProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
                        controller.productList[index].rating,
                      () {
                        Get.toNamed(Routes.productDetailView,arguments: controller.productList[index]);
                      },
                    );
                  }),
            )),
      ),
    );
  }
}
