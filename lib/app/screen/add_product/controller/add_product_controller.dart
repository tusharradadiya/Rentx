// ignore_for_file: prefer_typing_uninitialized_variables, avoid_function_literals_in_foreach_calls

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';
import 'package:short_uuids/short_uuids.dart';

class AddProductController extends GetxController {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');
  final LocalRepositoryInterFace localRepositoryInterFace;
  // Upload Photo
  final photo = [].obs;
  final uploadedPath = <String>[].obs;
  RxBool onProgress = false.obs;
  CarouselController carouselController = CarouselController();
  CarouselController carouselController2 = CarouselController();
  RxBool isMachineParts = false.obs;
  RxInt selectedIndex = 0.obs;
  final RxInt _currentPage = 0.obs;
  RxString categoryData = ''.obs;
  TextEditingController title = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController types = TextEditingController();
  TextEditingController condition = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController deposit = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();

  GlobalKey<FormState> formkey1 = GlobalKey();
  GlobalKey<FormState> formkey3 = GlobalKey();

  AddProductController(this.localRepositoryInterFace);

  get currentPage => _currentPage.value;

  set currentPage(value) => _currentPage(value);

  void nextPage() {
    carouselController2.nextPage(
        duration: 700.milliseconds, curve: Curves.decelerate);
  }
  RxString addressValue = 'Select Address'.obs;
  RxList addressAreaList = [
    "Select Address",
    "Sarthana Surat",
    "Nana Varachha Surat",
    "Mota Varachha Surat",
    "Punagam Surat",
    "Pasodra Surat",
    "Velanja Surat",
    "Kamrej Surat",
    "Valak Patiya Surat",
    "Adajan Surat",
    "Palanpur Jakatnaka Surat",
    "Pal Surat",
    "Vesu Surat",
    "Utran Surat",
    "Amroli Surat",
    "Kosad Surat",
    "Olpad Surat",
    "Nanpura Surat",
    "AthwaGate Surat",
    "Dabholi Surat",
    "Katargam Surat",
    "Magob Surat",
    "Dindoli Surat",
  ].obs;

  uploadFiles() async {
    // onProgress(true);
    photo.forEach((element) async {
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('Posts/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = storageReference.putFile(File(element));
      await uploadTask.whenComplete(() async {
        uploadedPath.add(await storageReference.getDownloadURL());
      });
    });
    // onProgress(false);
  }

  Future<void> addProduct({
    required String category,
    required String location,
    required String price,
    required String productName,
    required List productImage,
    required String condition,
    required String brand,
    required String discription,
    required String userName,
    required String userProfileImage,
    required String deposit,
    required String phone,
  }) async {
    showLoading();
    String fileID = const ShortUuid().generate();
    await productCollection.doc(fileID).set(ProductModel.fromJson({
          "category": category,
          "id": fileID,
          "location": location,
          "price": price,
          "productImage": productImage,
          "phone": phone,
          "productName": productName,
          "rating": "",
          "condition": condition,
          "brand": brand,
          "discription": discription,
          "userName": userName,
          "userProfileImage": userProfileImage,
          "deposit": deposit,
          "user_id": localRepositoryInterFace.getUserId(),
          "isAvailable": true
        }).toJson());
    Get.offAllNamed(Routes.homeScreen);
  }

  @override
  void onInit() {
    condition.text = 'Choose condition';
    super.onInit();
  }
}
