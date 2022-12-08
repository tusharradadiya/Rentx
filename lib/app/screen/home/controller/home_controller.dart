import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rentx/app/model/product_model.dart';

class HomeController extends GetxController {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');

  List<ProductModel> productList = [];

  Future<void> fetchProductData() async {
    await productCollection
        .where('id', isNotEqualTo: '')
        .get()
        .then((productData) {
      if (productData.docs.isNotEmpty) {
        productData.docs.forEach((element) {
          Map<String, dynamic> object = element.data() as Map<String, dynamic>;
          ProductModel product = ProductModel.fromJson(object);
          if (!productList.contains(product)) {
            productList.add(product);
          }
        });
      }
    });
  }

  @override
  void onInit() {
    fetchProductData();
    super.onInit();
  }
}
