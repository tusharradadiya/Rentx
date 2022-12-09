import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AddProductController extends GetxController {
  // Upload Photo
  final photo = <String>[].obs;
  final uploadedPath = <String>[].obs;
  RxBool onProgress = false.obs;
  CarouselController carouselController = CarouselController();
  CarouselController carouselController2 = CarouselController();
  RxBool isMachineParts = false.obs;
  RxInt selectedIndex = 0.obs;
  final RxInt _currentPage = 0.obs;
  var categoryData;
  TextEditingController title = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController types = TextEditingController();
  TextEditingController condition = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  GlobalKey<FormState> formkey1 = GlobalKey();
  GlobalKey<FormState> formkey3 = GlobalKey();

  get currentPage => _currentPage.value;

  set currentPage(value) => _currentPage(value);

  void nextPage()
  {
      carouselController2.nextPage(duration: 700.milliseconds,curve: Curves.decelerate);
  }

  uploadFiles() async {
    // onProgress(true);
    // final StorageService storageService = StorageService();
    // for (int i = 0; i < photo.length; i++) {
    //   var path = await storageService.uploadFiles(File(photo[i]));

    //   if (path != null) uploadedPath.add(path);
    // }
    // onProgress(false);
  }

  @override
  void onInit() {
    condition.text='Choose condition';
    super.onInit();
  }
}
