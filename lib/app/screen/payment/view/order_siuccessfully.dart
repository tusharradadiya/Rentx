import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/routes/app_page.dart';

class OrderSuccesfullyView extends StatelessWidget {
  const OrderSuccesfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.homeScreen);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAllNamed(Routes.homeScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      elevation: 5.0,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset('assets/images/successfully.png'),
              const SizedBox(height: 25.0),
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Your Order\nPlaced Succesfully',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
