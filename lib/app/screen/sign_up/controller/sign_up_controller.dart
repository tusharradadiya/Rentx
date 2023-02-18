import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rentx/app/model/user_model.dart';
import 'package:rentx/app/routes/app_page.dart';

class SignUpController extends GetxController {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool isObsecure = false.obs;

  GlobalKey<FormState> signUpformKey = GlobalKey();

  Future<void> handleEmailSignIn(
      String email, String password, String name, String phone) async {
    showLoading();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) async {
        await value.user?.sendEmailVerification();

        await userCollection.doc(value.user?.uid).get().then((values) async {
          if (!values.exists) {
            UserModel user = UserModel(
                createdAt: DateTime.now(),
                emailVerified: value.user?.emailVerified ?? false,
                username: name,
                emailId: email,
                profileImage: '',
                phone: phone,
                userId: value.user?.uid ?? '');
            await userCollection.doc(value.user?.uid).set(user.toJson());
            nameController.text = '';
            emailController.text = '';
            passwordController.text = '';
            confirmPasswordController.text = '';
            Fluttertoast.showToast(msg: 'Verification Email Send Succesfully');
            Get.offAllNamed(Routes.loginScreen);
          }
        });
        // if (value.user?.uid != null) {}
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.back();
        Get.focusScope?.unfocus();
        Fluttertoast.showToast(msg: 'Email is Already Register');
      }
    }
  }
}

showLoading() {
  Get.dialog(AlertDialog(
      content: Container(
    alignment: Alignment.center,
    color: Colors.white,
    width: 100,
    height: 100,
    // ignore: prefer_const_constructors
    child: CircularProgressIndicator(
      color: Colors.black,
    ),
  )));
}
