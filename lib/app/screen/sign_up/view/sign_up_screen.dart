import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentx/app/domain/screen_size.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offNamed(Routes.loginScreen);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('New Registration'),
          leading: GestureDetector(
              onTap: () {
                Get.offNamed(Routes.loginScreen);
              },
              child: const Icon(Icons.arrow_back)),
        ),
        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: controller.signUpformKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
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
                      controller: controller.nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-z A-Z á-ú Á-Ú]")),
                      ],
                      keyboardType: TextInputType.text,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter  Email';
                        } else if (!EmailValidator.validate(value)) {
                          return 'Please Enter Valid Email';
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
                  const SizedBox(height: 15.0),
                  Text(
                    'Phone Number',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10)
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                      controller: controller.phoneController,
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
                          hintText: 'Please Enter your Phone Number'),
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
                      child: Obx(
                        () => TextFormField(
                          obscureText: controller.isObsecure.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.isObsecure.value =
                                        !controller.isObsecure.value;
                                  },
                                  child: Icon(
                                      controller.isObsecure.value
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined,
                                      color: Colors.redAccent)),
                              filled: true,
                              fillColor: Colors.redAccent.withOpacity(0.10),
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.redAccent, size: 26),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              hintText: 'Please Enter Password'),
                        ),
                      )),
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
                    child: Obx(() => TextFormField(
                          obscureText: controller.isObsecure.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Conform Password';
                            } else if (value !=
                                controller.passwordController.text) {
                              return 'Password and Confirm Password does not match';
                            }
                            return null;
                          },
                          controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    controller.isObsecure.value =
                                        !controller.isObsecure.value;
                                  },
                                  child: Icon(
                                      controller.isObsecure.value
                                          ? Icons.remove_red_eye
                                          : Icons.remove_red_eye_outlined,
                                      color: Colors.redAccent)),
                              filled: true,
                              fillColor: Colors.redAccent.withOpacity(0.10),
                              prefixIcon: const Icon(Icons.person,
                                  color: Colors.redAccent, size: 26),
                              isDense: true,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  borderSide: const BorderSide(
                                      color: Colors.redAccent)),
                              hintText: 'Please Enter Confirm Password'),
                        )),
                  ),
                  const SizedBox(height: 40.0),
                  GestureDetector(
                    onTap: () {
                      if (controller.signUpformKey.currentState!.validate()) {
                        controller.handleEmailSignIn(
                            controller.emailController.text,
                            controller.passwordController.text,
                            controller.nameController.text,
                            controller.phoneController.text);
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
                            child: Text('Sign up',
                                style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
