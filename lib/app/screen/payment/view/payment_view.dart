import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pay/pay.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/payment/controller/payment_controller.dart';

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
                        Text('Vijay Laheri',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          const SizedBox(width: 15.0),
                          Text('Mota Varachha',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.call),
                        const SizedBox(width: 15.0),
                        Text('+919537888243',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400)),
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
                        Radio(
                          value: true,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
                        RawGooglePayButton(
                          type: GooglePayButtonType.pay,
                          onPressed: controller.onGooglePayPressed,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: false,
                          groupValue: true,
                          onChanged: (value) {},
                        ),
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
                    Text('10,000/-',
                        style: GoogleFonts.roboto(
                            color: Colors.blue,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.orderSuccesfullyView);
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
