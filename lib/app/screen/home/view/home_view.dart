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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)),
            child: Drawer(
              elevation: 5.0,
              width: 250,
              child: SafeArea(
                child: ListView(
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                      ),
                      currentAccountPictureSize: const Size(50, 50),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: controller.localRepositoryInterFace
                                .getUser()
                                .profileImage
                                .toString()
                                .isNotEmpty
                            ? NetworkImage(controller.localRepositoryInterFace
                                    .getUser()
                                    .profileImage ??
                                '')
                            : const NetworkImage(
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        radius: 25,
                      ),
                      accountName: Text(
                        controller.localRepositoryInterFace.getUser().username,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500),
                      ),
                      accountEmail: Text(
                        controller.localRepositoryInterFace.getUser().emailId,
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.home),
                      title: Text(
                        'Home',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.offNamed(Routes.addProductView);
                      },
                      dense: true,
                      leading: const Icon(Icons.production_quantity_limits),
                      title: Text(
                        'Add Product',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.offNamed(Routes.orderhistoryView);
                      },
                      dense: true,
                      leading: const Icon(Icons.bookmark_border),
                      title: Text(
                        'Order History',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.offNamed(Routes.myProductView);
                      },
                      dense: true,
                      leading: const Icon(Icons.ad_units_rounded),
                      title: Text(
                        'My Product',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                    ListTile(
                      dense: true,
                      leading: const Icon(Icons.contacts_sharp),
                      title: Text(
                        'Contact Us',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                    ListTile(
                      onTap: () {
                        controller.handleSignOut();
                      },
                      dense: true,
                      leading: const Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(thickness: 1.0, height: 10.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('RentX'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: const Icon(Icons.search,
                            color: Colors.redAccent, size: 26),
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
                        hintText: 'Please Enter Product Name'),
                  ),
                ),
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.categoryDetailView,
                            arguments: 'Car');
                      },
                      child: Card(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.categoryDetailView,
                            arguments: 'Bike');
                      },
                      child: Card(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.categoryDetailView,
                            arguments: 'Mobile');
                      },
                      child: Card(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.categoryDetailView,
                            arguments: 'Camera');
                      },
                      child: Card(
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.popularProductView);
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Obx(
                    () => GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.productList.length > 4
                            ? 6
                            : controller.productList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.8,
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0),
                        itemBuilder: (context, index) {
                          return productCard(
                            controller.productList[index].productImage,
                            controller.productList[index].productName,
                            controller.productList[index].location,
                            controller.productList[index].price,
                            controller.productList[index].rating,
                            () {
                              Get.toNamed(Routes.productDetailView,
                                  arguments: controller.productList[index]);
                            },
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget productCard(String productImage, String productname, String location,
    String price, String rating, Function()? onTap) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: ScreenSize.screenSize.width * 0.45,
      child: Card(
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
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
                  '₹ $price/ Day',
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
    ),
  );
}
