// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class OrderHistoryController extends GetxController {
  CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('Order');
  final LocalRepositoryInterFace localRepositoryInterFace;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');
  OrderHistoryController(this.localRepositoryInterFace);
  RxList orderList = [].obs;

  Future<void> fetchOrderData(String userId) async {
    orderList.clear();
    showLoading();
    await orderCollection
        .where('user_id', isEqualTo: userId)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) async {
          Map<String, dynamic> data = element.data() as Map<String, dynamic>;
          String date =
              DateFormat('dd-MM-yyyy').format(data['endDate'].toDate());
          String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
          if (!orderList.contains(data)) {
            if (date == todayDate) {
              await orderCollection
                  .doc(data['id'])
                  .update({"status": 'Closed'});
              await productCollection
                  .doc(data['productId'])
                  .update({"isAvailable": true});
            }
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
