import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rentx/app/model/product_model.dart';

class CategoryDetailController extends GetxController {
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');

  var productList = <ProductModel>[].obs;
  RxString category = ''.obs;
  RxBool isDataFetch = false.obs;

  Future<void> fetchProductData(String category) async {
    productList.clear();
    await productCollection
        .where('category', isEqualTo: category)
        .where('isAvailable', isEqualTo: true)
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

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => isDataFetch.value = true);
    super.onReady();
  }
}
