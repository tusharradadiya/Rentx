import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/order_checkout/controller/order_checkout_controller.dart';

import '../../../domain/screen_size.dart';

class OrderCheckoutView extends GetWidget<OrderCheckoutController> {
  const OrderCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.productDetailView);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('Order Checkout'),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 5.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://firebasestorage.googleapis.com/v0/b/rentx-992e2.appspot.com/o/bike3.png?alt=media&token=44e96b8b-1036-44e2-ac37-6cec7b42cee4',
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2020 Apple iPad Air 10.9"',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10.0),
                          Text('5000/- Per Day"',
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Text('Shipping Information',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.redAccent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.redAccent)),
                      hintText: 'Please Enter Your Name'),
                ),
              ),
              TextFormField(
                maxLines: 4,
                readOnly: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.redAccent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.redAccent)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.redAccent)),
                    hintText: 'Please Enter Your Address'),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Deposit',
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Text('10,000/-',
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      Row(
                        children: [
                          Text('Total Days',
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Text('10',
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.50),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Divider(
                        thickness: 1.5,
                      ),
                      Row(
                        children: [
                          Text('Total Amount',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                          const Spacer(),
                          Text('₹10000',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.paymentView);
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
                        child: Text('CheckOut',
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
      ),
    );
  }
}
