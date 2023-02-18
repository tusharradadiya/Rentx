import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/my_product_history/controller/my_product_history_controller.dart';

class MyProductHistoryView extends GetWidget<MyProductHistoryController> {
  const MyProductHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(() => controller.orderList.isNotEmpty
              ? ListView.builder(
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                controller.orderList[index]['productImage'][0],
                                width: ScreenSize.screenSize.width * 0.22,
                                height: 80,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'User Name : ${controller.orderList[index]['name']}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'Product Name : ${controller.orderList[index]['productName']}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'Purchase Date : ${DateFormat('dd-MM-yyyy').format(controller.orderList[index]['purchaseDate'].toDate())}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'End Date : ${DateFormat('dd-MM-yyyy').format(controller.orderList[index]['endDate'].toDate())}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'User Contact Detail : ${controller.orderList[index]['phone']}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        'Status : ${controller.orderList[index]['status']}',
                                        style: GoogleFonts.roboto(
                                            color: Colors.black,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      'Total Amount Pay : ₹${controller.orderList[index]['amount']}',
                                      style: GoogleFonts.roboto(
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                  'No Order Found',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ))),
        ),
      ),
    );
  }
}
