import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rentx/app/model/product_model.dart';

class CategoryDetailController extends GetxController {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');

  var productList = <ProductModel>[].obs;
  RxString category = ''.obs;

  Future<void> fetchProductData(String category) async {
    await productCollection
        .where('category', isEqualTo: category)
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

  @override
  void onInit() {
    fetchProductData(Get.arguments);
    category.value = Get.arguments;
    super.onInit();
  }
}
