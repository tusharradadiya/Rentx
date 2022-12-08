import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> handleEmailSignIn(
      String email, String password, String name) async {
    showLoading();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      await userCollection.doc(value.user?.uid).get().then((values) async {
        if (!values.exists) {
          UserModel user = UserModel(
              createdAt: DateTime.now(),
              username: name,
              emailId: email,
              profileImage: '',
              userId: value.user?.uid ?? '');
          await userCollection.doc(value.user?.uid).set(user.toJson());
        } else {}
      });
      if (value.user?.uid != null) {}
    });

    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    Get.offNamed(Routes.loginScreen);
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
