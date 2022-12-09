import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/screen/product_detail/controller/product_detail_controller.dart';

class ProductDetailView extends GetWidget<ProductDetailController>
{
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: CachedNetworkImage(
                      imageUrl: controller.productModel?.productImage??'',
                      height: ScreenSize.screenSize.height*0.40,
                      width: ScreenSize.screenSize.width,
                      fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 10.0),
                  child: Text('Product Name',
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                ),
                Text('The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars...',
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
                        backgroundImage: AssetImage('assets/images/profile_image.jpg'),
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
                      Spacer(),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(Icons.call),
                        ),
                      )
                    ],
                  ),
                ),
                Text('Price',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500)),


      ],),
          )),
    );
  }

}