import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';

class MyProductController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;
  final CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');

  var productList = <ProductModel>[].obs;

  MyProductController(this.localRepositoryInterFace);

  Future<void> fetchProductData(String userId) async {
    await productCollection
        .where('user_id', isEqualTo: userId)
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
    fetchProductData(localRepositoryInterFace.getUserId());
    super.onInit();
  }
}
