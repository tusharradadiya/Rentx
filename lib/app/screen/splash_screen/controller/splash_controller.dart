import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/routes/app_page.dart';

class SplashController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;

  SplashController(this.localRepositoryInterFace);

  initNotificationHandler() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(const Duration(seconds: 3), () async {
        if (localRepositoryInterFace.readOnBoardingPageLoaded()) {
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.toNamed(Routes.loginScreen);
        }
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
    initNotificationHandler();
  }
}
