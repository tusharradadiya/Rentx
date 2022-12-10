import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/screen/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    final controller = Get.find<SplashController>();
    controller.initNotificationHandler();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/splash.jpg',
            height: 300,
            width: ScreenSize.screenSize.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(height: 30.0),
          Text(
            'RentX',
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
