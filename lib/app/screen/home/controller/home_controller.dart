import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';
import 'package:rentx/app/routes/app_page.dart';

class HomeController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');

  var productList = <ProductModel>[].obs;

  HomeController(this.localRepositoryInterFace);

  Future<void> fetchProductData() async {
    await productCollection
        .where('id', isNotEqualTo: '')
        .get()
        .then((productData) {
      if (productData.docs.isNotEmpty) {
        for (var element in productData.docs) {
          Map<String, dynamic> object = element.data() as Map<String, dynamic>;
          ProductModel product = ProductModel.fromJson(object);
          if (!productList.contains(product)) {
            productList.add(product);
          }
        }
      }
    });
  }

  Future<void> handleSignOut() async {
    FirebaseAuth.instance.signOut().then((value) {
      localRepositoryInterFace.clearAllData();
      Get.offAllNamed(Routes.loginScreen);
    });
  }

  @override
  void onInit() {
    fetchProductData();
    super.onInit();
  }
}
