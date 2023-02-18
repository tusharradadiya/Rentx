import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/order_history/controller/order_history_controller.dart';

class OrderHistoryView extends GetWidget<OrderHistoryController> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: const Text('Order History'),
            leading: GestureDetector(
                onTap: () {
                  Get.offNamed(Routes.homeScreen);
                },
                child: const Icon(Icons.arrow_back)),
          ),
          body: SafeArea(
              child: Obx(
            () => controller.orderList.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.orderList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                Image.network(
                                  controller.orderList[index]['productImage']
                                      [0],
                                  width: ScreenSize.screenSize.width * 0.25,
                                  height: 80,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.orderList[index]
                                          ['productName'],
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    controller.orderList[index]['orderId'] !=
                                            null
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5.0),
                                            child: Text(
                                              'Order ID : ${controller.orderList[index]['orderId']}',
                                              style: GoogleFonts.roboto(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500),
                                            ))
                                        : const SizedBox(),
                                    controller.orderList[index]['paymentId'] !=
                                            null
                                        ? Text(
                                            'Payment Id : ${controller.orderList[index]['paymentId']}',
                                            style: GoogleFonts.roboto(
                                                color: Colors.black,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : const SizedBox(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'PaymentMode : ${controller.orderList[index]['paymentMode']}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'Amount : ${controller.orderList[index]['amount']}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'Days For Rent : ${controller.orderList[index]['totalDay']}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'Purchase Date: ${DateFormat('dd-MM-yyyy').format(controller.orderList[index]['purchaseDate'].toDate())}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'Status: ${controller.orderList[index]['status']}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'End Date: ${DateFormat('dd-MM-yyyy').format(controller.orderList[index]['endDate'].toDate())}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : Center(
                    child: Text(
                    'No Order Found',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500),
                  )),
          ))),
    );
  }
}
