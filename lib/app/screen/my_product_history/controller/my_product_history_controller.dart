import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class MyProductHistoryController extends GetxController {
  CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('Order');
  final LocalRepositoryInterFace localRepositoryInterFace;
  MyProductHistoryController(this.localRepositoryInterFace);
  RxList orderList = [].obs;

  Future<void> fetchOrderData(String userId) async {
    orderList.clear();
    showLoading();
    await orderCollection
        .where('ownerId', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) async {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;
          if (!orderList.contains(data)) {
            orderList.add(data);
          }
        });
      }
    });
    Get.back();
  }

  @override
  void onReady() {
    fetchOrderData(localRepositoryInterFace.getUserId());
    super.onReady();
  }
}
