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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/app_logo.png',
            height: 200,
            width: ScreenSize.screenSize.width,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40.0),
          Text(
            'RentX',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
