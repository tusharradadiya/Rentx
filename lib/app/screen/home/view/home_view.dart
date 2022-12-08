import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/home/controller/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('RentX'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10.0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //         filled: true,
            //         fillColor: Colors.redAccent.withOpacity(0.10),
            //         prefixIcon: const Icon(Icons.person,
            //             color: Colors.redAccent, size: 26),
            //         isDense: true,
            //         enabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(80),
            //             borderSide: const BorderSide(color: Colors.redAccent)),
            //         disabledBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(80),
            //             borderSide: const BorderSide(color: Colors.redAccent)),
            //         focusedBorder: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(80),
            //             borderSide: const BorderSide(color: Colors.redAccent)),
            //         hintText: 'Please Enter your Name'),
            //   ),
            // ),
            Text(
              'Categories',
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/car_image.png',
                          width: ScreenSize.screenSize.width * 0.15,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Car',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/bike.png',
                          width: ScreenSize.screenSize.width * 0.15,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Bike',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/mobile.png',
                          width: ScreenSize.screenSize.width * 0.15,
                          height: 38,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Mobile',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/camera-8409.png',
                          width: ScreenSize.screenSize.width * 0.15,
                          height: 38,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Camera',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  'Popular Categories',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Text(
                  'See All',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 195,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.productList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return productCard(
                        controller.productList[index].productImage,
                        controller.productList[index].productName,
                        controller.productList[index].location,
                        controller.productList[index].rating);
                  },
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.addProductView);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

Widget productCard(
    String productImage, String productname, String location, String rating) {
  return SizedBox(
    width: ScreenSize.screenSize.width * 0.45,
    child: Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productImage,
              width: ScreenSize.screenSize.width * 0.40,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10.0),
            Text(
              productname,
              style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                location,
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Text(
                '₹ 1000/ Month',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orange,
                  size: 20,
                ),
                const SizedBox(width: 5.0),
                Text(
                  rating,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
