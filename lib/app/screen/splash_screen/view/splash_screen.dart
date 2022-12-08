import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/screen/splash_screen/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  @override
  void initState() {
   final controller = Get.find<SplashController>();
   controller.initNotificationHandler();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenSize.screenSize = MediaQuery.of(context).size;
    return Image.asset(
      'assets/images/splash.jpg',
      height: ScreenSize.screenSize.height,
      width: ScreenSize.screenSize.width,
      fit: BoxFit.fill,
    );
  }
}
