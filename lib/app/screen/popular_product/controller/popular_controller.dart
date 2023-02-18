import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';

class PopularProductController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');
  RxBool isDataFetch = false.obs;
  var productList = <ProductModel>[].obs;

  PopularProductController(this.localRepositoryInterFace);

  Future<void> fetchProductData() async {
    productList.clear();
    await productCollection
        .where('user_id', isNotEqualTo: localRepositoryInterFace.getUserId())
        .get()
        .then((productData) {
      if (productData.docs.isNotEmpty) {
        for (var element in productData.docs) {
          Map<String, dynamic> object = element.data() as Map<String, dynamic>;
          ProductModel product = ProductModel.fromJson(object);
          if (product.isAvailable == true) {
            if (!productList.contains(product)) {
              productList.add(product);
            }
          }
        }
      }
    });
  }

  @override
  void onInit() {
    fetchProductData();
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => isDataFetch.value = true);
    super.onReady();
  }
}
