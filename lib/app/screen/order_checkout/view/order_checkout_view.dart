import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Form(
              key: controller.orderKey,
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
                            imageUrl: controller.productModel?.productImage[0],
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
                              Text(controller.productModel?.productName ?? '',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(height: 10.0),
                              Text(
                                  '${controller.productModel?.price ?? ''}/- Per Day"',
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      controller: controller.name,
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent)),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Address';
                      }
                      return null;
                    },
                    controller: controller.address,
                    maxLines: 4,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        isDense: true,
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.redAccent)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.redAccent)),
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
                        hintText: 'Please Enter Your Address'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                      controller: controller.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          isDense: true,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.redAccent)),
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
                          hintText: 'Please Enter Your Phone Number'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
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
                                Text('₹ ${controller.productModel?.deposit}',
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
                                Obx(() => Text(controller.totalDays.value,
                                    style: GoogleFonts.roboto(
                                        color: Colors.black.withOpacity(0.50),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500))),
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
                                Text(
                                    '${(int.parse(controller.productModel?.deposit ?? '')) + ((int.parse(controller.productModel?.price ?? '')) * (int.parse(controller.totalDays.value)))}',
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
                  ),
                  GestureDetector(
                    onTap: () {
                      if (controller.orderKey.currentState!.validate()) {
                        int totalAmount = (int.parse(controller.productModel?.deposit ?? '')) + ((int.parse(controller.productModel?.price ?? '')) * (int.parse(controller.totalDays.value)));
                        Get.toNamed(Routes.paymentView, arguments: [
                          controller.productModel,
                          controller.totalDays.value,
                          controller.name.text,
                          controller.address.text,
                          totalAmount,
                          controller.phone.text,
                        ]);
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
            ),
          ),
        )),
      ),
    );
  }
}
