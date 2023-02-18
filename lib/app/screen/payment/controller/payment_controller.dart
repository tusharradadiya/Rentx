import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/product_model.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/payment/view/payment_view.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';
import 'package:short_uuids/short_uuids.dart';

class PaymentController extends GetxController {
  RxString name = ''.obs;
  RxString address = ''.obs;
  RxString phone = ''.obs;
  RxInt totalAmount = 0.obs;
  RxString totalDays = ''.obs;
  var razorpay = Razorpay();
  ProductModel? productModel;
  Rx<PaymentMode> paymentMode = PaymentMode.paywithonline.obs;
  CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('Order');
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection('Product');
  final LocalRepositoryInterFace localRepositoryInterFace;

  PaymentController(this.localRepositoryInterFace);

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    // Do something when payment succeeds
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    // Do something when payment fails
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  void makePayment(int amount, String name, String mobileNumber, String email,
      String productName) {
    var options = {
      'key': 'rzp_test_gqdjh5t4vYTWeD',
      'amount': (amount * 100),
      'name': name,
      'description': productName,
      'prefill': {'contact': mobileNumber, 'email': email}
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print('Error When Payment====$e');
    }
  }

  // void getSnackbarSuccess(String message, BuildContext context) {
  //   final snackBar = SnackBar(
  //     elevation: 0,
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     content: AwesomeSnackbarContent(
  //       title: 'Success!',
  //       message: message,
  //       contentType: ContentType.success,
  //     ),
  //   );
  //   ScaffoldMessenger.of(context)
  //     ..hideCurrentSnackBar()
  //     ..showSnackBar(snackBar);
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    showLoading();
    print('Payment Success');
    String uid = const ShortUuid().generate();
    String orderId = const ShortUuid().generate();
    var date = DateTime.now();
    await orderCollection.doc(uid).set({
      "orderId": response.orderId ?? orderId,
      "paymentId": response.paymentId ?? '',
      "amount": totalAmount.value,
      "name": name.value,
      "phone": phone.value,
      "address": address.value,
      "productImage": productModel?.productImage,
      "productName": productModel?.productName,
      "productPrice": productModel?.price,
      "totalDay": totalDays.value,
      "paymentMode": "Online",
      "ownerId": productModel?.userId,
      "user_id": localRepositoryInterFace.getUserId(),
      "productId": productModel?.id,
      "purchaseDate": date,
      "endDate": DateTime(
          date.year, date.month, date.day + int.parse(totalDays.value)),
      "status": "Open",
      "id": uid
    });
    await productCollection
        .doc(productModel?.id)
        .update({"isAvailable": false});
    Get.toNamed(Routes.orderSuccesfullyView);
  }

  Future<void> makeCODOrder() async {
    showLoading();
    String uid = const ShortUuid().generate();
    await orderCollection.doc(uid).set({
      "amount": totalAmount.value,
      "name": name.value,
      "phone": phone.value,
      "address": address.value,
      "productImage": productModel?.productImage,
      "productName": productModel?.productName,
      "productPrice": productModel?.price,
      "totalDay": totalDays.value,
      "paymentMode": "Cash On Delivery",
      "user_id": localRepositoryInterFace.getUserId(),
      "ownerId": productModel?.userId,
      "productId": productModel?.id,
      "purchaseDate": DateTime.now(),
      "status": "Open",
      "id": uid
    });
    await productCollection
        .doc(productModel?.id)
        .update({"isAvailable": false});
    Get.toNamed(Routes.orderSuccesfullyView);
  }

  void _handlePaymentError(PaymentFailureResponse response) async {}

  void _handleExternalWallet(ExternalWalletResponse response) async {}

  @override
  void onInit() {
    productModel = Get.arguments[0];
    totalDays.value = Get.arguments[1];
    name.value = Get.arguments[2];
    address.value = Get.arguments[3];
    phone.value = Get.arguments[5];
    totalAmount.value = Get.arguments[4];
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    print(productModel?.id);
    super.onInit();
  }
}
