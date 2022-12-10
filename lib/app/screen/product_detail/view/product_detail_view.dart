import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/product_detail/controller/product_detail_controller.dart';

class ProductDetailView extends GetWidget<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.homeScreen);
              },
              child: const Icon(Icons.arrow_back)),
          backgroundColor: Colors.redAccent,
          title: const Text('Product Detail'),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      imageUrl: controller.productModel?.productImage ?? '',
                      height: ScreenSize.screenSize.height * 0.40,
                      width: ScreenSize.screenSize.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: Text('Product Name',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                ),
                Text(
                    'The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400)),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                            AssetImage('assets/images/profile_image.jpg'),
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Vijay Laheri',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 3.0),
                          Text('Owner',
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Spacer(),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Icon(Icons.call),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text('Price',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Text('₹${controller.productModel?.price} Per Day',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text('How Many Days You want to Rent',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 200,
                  height: 45,
                  child: TextFormField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.redAccent.withOpacity(0.10),
                        isDense: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide:
                                const BorderSide(color: Colors.redAccent)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide:
                                const BorderSide(color: Colors.redAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(80),
                            borderSide:
                                const BorderSide(color: Colors.redAccent)),
                        hintText: 'Please Enter Day'),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 15.0),
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: RatingBar.builder(
                //       initialRating: 3,
                //       minRating: 1,
                //       direction: Axis.horizontal,
                //       itemCount: 5,
                //       itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                //       itemBuilder: (context, _) => const Icon(
                //         Icons.star,
                //         color: Colors.amber,
                //       ),
                //       onRatingUpdate: (rating) {
                //         print(rating);
                //       },
                //     ),
                //   ),
                // ),
                const SizedBox(height: 10.0),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.orderChekoutView);
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
                          child: Text('Placed Order',
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
        )),
      ),
    );
  }
}
