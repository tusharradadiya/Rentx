import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/login/controller/login_controller.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Log In to your Placoo account to explore your dream place to live across the whole world!',
                  style: GoogleFonts.roboto(
                      color: const Color(0xff7D7F88),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 60.0),
                Text(
                  'EmailId',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return null;
                    },
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.redAccent.withOpacity(0.10),
                        prefixIcon: const Icon(Icons.person,
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
                        hintText: 'Please Enter your Email Id'),
                  ),
                ),
                const SizedBox(height: 20.0),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.redAccent.withOpacity(0.10),
                        prefixIcon: const Icon(Icons.key_outlined,
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
                        hintText: 'Please Enter your Password'),
                  ),
                ),
                const SizedBox(height: 40.0),
                GestureDetector(
                  onTap: () {
                    if (controller.formKey.currentState!.validate()) {
                      controller.handleEmailLogIn(
                          controller.emailController.text,
                          controller.passwordController.text);
                    }
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
                          child: Text('Log in',
                              style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500))),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  width: ScreenSize.screenSize.width,
                  height: 48,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(50.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google_icon.png',
                          width: 24, height: 24, fit: BoxFit.fill),
                      const SizedBox(width: 40.0),
                      Text('Sign in with Google',
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.signUpScreen);
                    },
                    child: Text('New Member?',
                        style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500)),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
