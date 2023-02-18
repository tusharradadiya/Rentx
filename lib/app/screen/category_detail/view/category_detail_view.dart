import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/category_detail/controller/category_detail_controller.dart';
import 'package:rentx/app/screen/home/view/home_view.dart';

class CategoryDetailView extends GetWidget<CategoryDetailController> {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.delete<CategoryDetailController>();
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        body: Obx(() => controller.isDataFetch.value
            ? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: ScreenSize.screenSize.width * 0.03),
                child: Column(
                  children: [
                    const SizedBox(height: 5.0),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.delete<CategoryDetailController>();
                            Get.offNamed(Routes.homeScreen);
                          },
                          child: const Card(
                            elevation: 5.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Icon(Icons.west),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: ScreenSize.screenSize.width * 0.25,
                        // ),
                        // Card(
                        //   elevation: 5.0,
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 15.0, vertical: 5.0),
                        //     child: Obx(() => Text(
                        //           controller.category.value,
                        //           style: GoogleFonts.roboto(
                        //               color: Colors.black,
                        //               fontSize: 20.0,
                        //               fontWeight: FontWeight.w500),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                    Obx(
                      () => controller.productList.isNotEmpty
                          ? GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.productList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.80,
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
                                        arguments:
                                            controller.productList[index]);
                                  },
                                );
                              })
                          : Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 270),
                                child: Text(
                                  'No Product ',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                    ),
                  ],
                ))
            : const Center(
                child: CircularProgressIndicator(color: Colors.black),
              )),
      ),
    );
  }
}
