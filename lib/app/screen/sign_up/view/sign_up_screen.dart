import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController>
{
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.offNamed(Routes.loginScreen);
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.redAccent.withOpacity(0.10),
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.redAccent, size: 26),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      hintText: 'Please Enter your Name'),
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Email id',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.redAccent.withOpacity(0.10),
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.redAccent, size: 26),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      hintText: 'Please Enter your Email Id'),
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Password',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.redAccent.withOpacity(0.10),
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.redAccent, size: 26),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      hintText: 'Please Enter Password'),
                ),
              ),
              const SizedBox(height: 15.0),
              Text(
                'Confirm Password',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.redAccent.withOpacity(0.10),
                      prefixIcon:
                      const Icon(Icons.person, color: Colors.redAccent, size: 26),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(80),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      hintText: 'Please Enter Confirm Password'),
                ),
              ),
              const SizedBox(height: 15.0),
              const SizedBox(height: 40.0),
              SizedBox(
                width: ScreenSize.screenSize.width,
                height: 55,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.redAccent,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('Sign up',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

}