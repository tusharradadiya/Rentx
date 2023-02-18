import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/screen/payment/controller/payment_controller.dart';

enum PaymentMode { paywithonline, cashondelivery }

class PaymentView extends GetWidget<PaymentController> {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Make Payment'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0),
            Text('Shipping Information',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 15.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.person),
                        const SizedBox(width: 15.0),
                        Obx(() => Text(controller.name.value,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400))),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(width: 15.0),
                          Obx(() => Text(controller.address.value,
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400))),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.call),
                        const SizedBox(width: 15.0),
                        Obx(() => Text(controller.phone.value,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400))),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text('Payment Method',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 15.0),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: PaymentMode.paywithonline,
                              groupValue: controller.paymentMode.value,
                              onChanged: (value) {
                                controller.paymentMode.value = value!;
                              },
                            )),
                        Text('Pay With Online',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Row(
                      children: [
                        Obx(() => Radio(
                              value: PaymentMode.cashondelivery,
                              groupValue: controller.paymentMode.value,
                              onChanged: (value) {
                                controller.paymentMode.value = value!;
                              },
                            )),
                        Text('Cash On Delivery',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 15.0),
                child: Row(
                  children: [
                    Text('Total',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Obx(() => Text('₹${controller.totalAmount.value}',
                        style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600))),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.paymentMode.value == PaymentMode.paywithonline) {
                  controller.makePayment(
                      controller.totalAmount.value,
                      controller.name.value,
                      controller.phone.value,
                      controller.localRepositoryInterFace.getUser().emailId,
                      controller.productModel?.productName ?? '');
                } else {
                  controller.makeCODOrder();
                }
              },
              child: SizedBox(
                width: ScreenSize.screenSize.width,
                height: 55,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.redAccent,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Pay Now',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
