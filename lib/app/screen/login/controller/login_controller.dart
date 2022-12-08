import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';
import 'package:rentx/app/model/user_model.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterFace localRepositoryInterFace;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('User');

  LoginController(this.localRepositoryInterFace);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> handleGoogleSign() async {}

  Future<void> handleEmailLogIn(String email, String password) async {
    try {
      showLoading();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String uid = value.user!.uid;
        localRepositoryInterFace.saveUserId(uid);
        await userCollection
            .where('userId', isEqualTo: uid)
            .get()
            .then((value) {
          Map<String, dynamic> object =
              value.docs.first.data() as Map<String, dynamic>;
          localRepositoryInterFace.saveUser(UserModel(
              createdAt: object['createdAt'].toDate() ?? '',
              username: object['username'] ?? '',
              emailId: object['emailId'] ?? '',
              profileImage: object['profileImage'] ?? '',
              userId: object['userId'] ?? ''));
          localRepositoryInterFace.writeOnBoardingPageLoaded();
        });
      });
      Get.offNamed(Routes.homeScreen);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
