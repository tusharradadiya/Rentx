// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/add_product/controller/add_product_controller.dart';
import 'package:rentx/app/widget/custom_textfield.dart';

class AddProductView extends GetWidget<AddProductController> {
  final pages = [
    UploadPhoto(),
    const CategoriesPage(),
    const GeneralInformation(),
    PriceDetails(),
  ];
  AddProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.currentPage == 0) {
          Get.offNamed(Routes.homeScreen);
        } else {
          controller.carouselController2
              .previousPage(duration: 300.milliseconds, curve: Curves.ease);
        }
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.homeScreen);
              },
              child: const Icon(Icons.arrow_back)),
          iconTheme: IconThemeData(color: Colors.grey[800]),
          backgroundColor: const Color.fromARGB(255, 250, 248, 248),
          title: Row(children: [
            ...List.generate(
                pages.length,
                (index) => Obx(
                      () => AnimatedContainer(
                        duration: 600.milliseconds,
                        margin: const EdgeInsets.only(right: 8),
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.09,
                        color: (index < controller.currentPage ||
                                index == controller.currentPage)
                            ? Colors.blue
                            //     ? Colors.blue[200]
                            : controller.currentPage + 1 == index
                                ? Colors.blue[200]
                                : Colors.grey,
                      ),
                    )).toList()
          ]),
        ),
        body: CarouselSlider(
            carouselController: controller.carouselController2,
            items: pages,
            options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                aspectRatio: 1.0,
                height: double.infinity,
                autoPlay: false,
                initialPage: 0,
                onPageChanged: (index, reason) {
                  controller.currentPage = index;
                },
                viewportFraction: 1.0)),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          child: GestureDetector(
            onTap: () {
              controller.nextPage();
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
                    child: Text('Next',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UploadPhoto extends StatelessWidget {
  UploadPhoto({Key? key}) : super(key: key);

  final AddProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20.0),
          child: Text(
            "Upload photos of product you are selling ",
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Obx(() => Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.blue.shade50,
              child: controller.uploadedPath.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 65),
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                Get.bottomSheet(
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "Upload Photos",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: const Color(
                                                        0xff141414)),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          const Divider(
                                            thickness: 2,
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 56,
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  Colors.black),
                                                      onPressed: () async {
                                                        Get.back();
                                                        controller.photo
                                                            .clear();
                                                        var images =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .camera);
                                                        // images!.forEach((element) {
                                                        if (images != null) {
                                                          controller.photo
                                                              .add(images.path);
                                                          // });
                                                          controller
                                                              .uploadFiles();
                                                        }
                                                      },
                                                      child: const Text(
                                                        "Take Photo",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 56,
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      onPressed: () async {
                                                        controller.photo
                                                            .clear();
                                                        Get.back();
                                                        var images =
                                                            await ImagePicker()
                                                                .pickMultiImage();
                                                        images
                                                            .forEach((element) {
                                                          controller.photo.add(
                                                              element.path);
                                                        });
                                                        controller
                                                            .uploadFiles();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  Colors.black),
                                                      child: const Text(
                                                        "Choose from library",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                SizedBox(
                                                  height: 56,
                                                  width: double.infinity,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              elevation: 0,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xffEEEEEE)),
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 18),
                                                      )),
                                                ),
                                                const SizedBox(height: 32),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    isScrollControlled: true);
                              },
                              child: Image.asset('assets/images/add_photo.png',
                                  width: 80, height: 80, fit: BoxFit.fill)),
                          const SizedBox(height: 16),
                          Text(
                              "Upload product photo that clearly describes products easily",
                              style: GoogleFonts.roboto(
                                  fontSize: 16.0,
                                  color: const Color(0xff545454),
                                  fontWeight: FontWeight.w400))
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 270,
                      child: Stack(
                        children: [
                          CarouselSlider(
                              carouselController: controller.carouselController,
                              items: List.generate(
                                controller.uploadedPath.length,
                                (index) => Stack(
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl:
                                          (controller.uploadedPath[index]),
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.contain,
                                    ),
                                    controller.uploadedPath.isNotEmpty
                                        ? Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 4.0),
                                              child: InkWell(
                                                  onTap: () {
                                                    controller.uploadedPath
                                                        .removeAt(index);
                                                  },
                                                  child: const CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xffD9D9D9),
                                                      radius: 13,
                                                      child: Icon(Icons.close,
                                                          color: Colors.white,
                                                          size: 20))),
                                            ),
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                              options: CarouselOptions(
                                  scrollPhysics:
                                      const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  aspectRatio: 1.0,
                                  height: 270,
                                  autoPlay: false,
                                  initialPage: 0,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1.0)),
                          controller.uploadedPath.length > 1
                              ? Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 18.0),
                                    child: InkWell(
                                      onTap: () {
                                        controller.carouselController.nextPage(
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.linear);
                                      },
                                      child: const CircleAvatar(
                                          backgroundColor: Color(0xffD9D9D9),
                                          radius: 15,
                                          child: Icon(
                                              Icons.keyboard_arrow_right,
                                              color: Colors.white)),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
            )),
        Obx(() => (controller.uploadedPath.isNotEmpty &&
                controller.uploadedPath.isNotEmpty)
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "Upload Photos",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            color: const Color(0xff141414)),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Divider(
                                    thickness: 2,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 56,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.black),
                                              onPressed: () async {
                                                Get.back();
                                                controller.photo.clear();
                                                XFile? images =
                                                    await ImagePicker()
                                                        .pickImage(
                                                            source: ImageSource
                                                                .camera);
                                                // images!.forEach((element) {
                                                if (images != null) {
                                                  controller.photo
                                                      .add(images.path);
                                                  controller.uploadFiles();
                                                }
                                              },
                                              child: const Text(
                                                "Take Photo",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 56,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              onPressed: () async {
                                                controller.photo.clear();
                                                Get.back();
                                                var images = await ImagePicker()
                                                    .pickMultiImage();
                                                images.forEach((element) {
                                                  controller.photo
                                                      .add(element.path);
                                                });
                                                controller.uploadFiles();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.black),
                                              child: const Text(
                                                "Choose from library",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SizedBox(
                                          height: 56,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      const Color(0xffEEEEEE)),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                "Cancel",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              )),
                                        ),
                                        const SizedBox(height: 32),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            isScrollControlled: true);
                      },
                      child: Image.asset('assets/add_photo.png',
                          width: 80, height: 80, fit: BoxFit.fill)),
                ),
              )
            : const SizedBox()),
        const SizedBox(
          height: 24,
        ),
      ]),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final AddProductController addProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Select Categories',
                style: GoogleFonts.roboto(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff141414)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Obx(() => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    alignment: Alignment.center,
                    child: Wrap(
                        runSpacing: 24,
                        spacing: MediaQuery.of(context).size.width * 0.02,
                        children: List.generate(
                            categoryItemList.length,
                            (index) => CategoryItem(
                                onTap: () {
                                  addProductController.selectedIndex.value =
                                      index;
                                  addProductController.categoryData =
                                      categoryItemList[index].label;
                                  if (addProductController.categoryData ==
                                      'Cars/Bikes') {
                                    addProductController.isMachineParts.value =
                                        true;
                                  } else {
                                    addProductController.isMachineParts.value =
                                        false;
                                  }
                                },
                                isSelected:
                                    addProductController.selectedIndex.value ==
                                            index
                                        ? true
                                        : false,
                                icon: categoryItemList[index].icon,
                                label: categoryItemList[index].label))),
                  )),
            ]),
          ),
        ),
      ),
    );
  }

  var categoryItemList = <CategoriesModel>[
    CategoriesModel(label: "Cars", icon: 'assets/images/car_image.png'),
    CategoriesModel(label: "Bike", icon: 'assets/images/bike.png'),
    CategoriesModel(label: "Mobiles", icon: 'assets/images/mobile.png'),
    CategoriesModel(label: "Camera", icon: 'assets/images/camera-8409.png'),
  ];
}

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: controller.formkey1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("General information",
                style: GoogleFonts.roboto(
                    fontSize: 24, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 26,
            ),
            CustomFormField(
                label: "Add Title *",
                controller: controller.title,
                validator: (String? v) {
                  if (v!.isEmpty) {
                    return '* Required';
                  }
                },
                hintText: "Brand, model, colour, and size."),
            CustomFormField(
                validator: (String? v) {
                  if (v!.isEmpty) {
                    return '* Required';
                  }
                },
                controller: controller.brand,
                label: "Brand *",
                hintText: "Enter Your Brand Name"),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Condition *",
                ),
                const SizedBox(
                  height: 6,
                ),
                DropdownButtonFormField(
                  onChanged: (value) {
                    setState(() {
                      controller.condition.text = value!;
                    });
                  },
                  isDense: true,
                  value: controller.condition.text,
                  // style: GoogleFonts.ibmPlexSans(fontSize: 14.0,fontWeight: FontWeight.w400,color: Color(0xffAFAFAF)),
                  hint: const Text("Select a value"),

                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      border: OutlineInputBorder(),
                      hintText: 'Within my area'),
                  items: const [
                    DropdownMenuItem(
                      value: 'Choose condition',
                      child: Text("Choose condition"),
                    ),
                    DropdownMenuItem(
                      value: 'Brand New',
                      child: Text("Brand New"),
                    ),
                    DropdownMenuItem(
                      value: 'Like New',
                      child: Text("Like New"),
                    ),
                    DropdownMenuItem(
                      value: 'Used',
                      child: Text("Used"),
                    ),
                    DropdownMenuItem(
                      value: 'Heavily Used',
                      child: Text("Heavily Used"),
                    ),
                    // DropdownMenuItem(child:,)
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            CustomFormField(
              validator: (String? v) {
                if (v!.isEmpty) {
                  return '* Required';
                }
              },
              controller: controller.description,
              label: "Description*",
              desc: true,
              hintText: 'Include special feature and reason for selling',
            ),
          ],
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  PriceDetails({Key? key}) : super(key: key);
  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formkey3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 20.0),
              child: Text("Price details",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomFormField(
                  controller: controller.price,
                  label: 'Price *',
                  hintText: 'Enter price',
                  maxLength: 10,
                  isnum: true,
                  validator: (String? value) {
                    if (value! == '') {
                      return '* Required';
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomFormField(
                  controller: controller.price,
                  label: 'Address *',
                  hintText: 'Enter Address',
                  maxLength: 10,
                  isnum: true,
                  validator: (String? value) {
                    if (value! == '') {
                      return '* Required';
                    }
                  }),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriesModel {
  final String label;
  final String icon;

  CategoriesModel({required this.label, required this.icon});
}

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);
  final String label;
  final String icon;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5.0,
          child: Container(
            height: 113,
            width: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: Image.asset(icon),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.ibmPlexSans(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                        color: const Color(0xff141414)),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
