import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  GlobalKey<FormState> loginFormKey = GlobalKey();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isObsecure = false.obs;

  Future<void> handleGoogleSign() async {
    showLoading();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserModel userInfo;
    var firebaseUser = (await _auth.signInWithCredential(credential)).user;
    final result = await FirebaseFirestore.instance
        .collection('User')
        .doc(firebaseUser?.uid)
        .get();
    if (result.exists) {
      userInfo = UserModel.fromSnapshot(result);
      localRepositoryInterFace.saveUserId(firebaseUser?.uid ?? '');
      localRepositoryInterFace.saveUser(UserModel.fromSnapshot(result));
      localRepositoryInterFace.writeOnBoardingPageLoaded();
      await FirebaseFirestore.instance
          .collection('User')
          .doc(firebaseUser?.uid)
          .update(userInfo.toJson());
      emailController.clear();
      passwordController.clear();
      Get.offNamed(Routes.homeScreen);
    } else {
      userInfo = UserModel.fromJson({
        'createdAt': DateTime.now(),
        'username': firebaseUser?.displayName,
        'emailId': firebaseUser?.email,
        'emailVerified': firebaseUser?.emailVerified,
        'profileImage': firebaseUser?.photoURL ?? '',
        'userId': firebaseUser?.uid,
        'phone': firebaseUser?.phoneNumber ?? ''
      });
      await FirebaseFirestore.instance
          .collection('User')
          .doc(firebaseUser?.uid)
          .set(userInfo.toJson());
      localRepositoryInterFace.saveUserId(firebaseUser?.uid ?? '');
      localRepositoryInterFace.saveUser(userInfo);
      localRepositoryInterFace.writeOnBoardingPageLoaded();
      emailController.clear();
      passwordController.clear();
      Get.offNamed(Routes.homeScreen);
    }
  }

  Future<void> handleEmailLogIn(String email, String password) async {
    try {
      showLoading();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        String uid = value.user!.uid;
        if (value.user?.emailVerified == true) {
          localRepositoryInterFace.saveUserId(uid);
          await userCollection
              .where('userId', isEqualTo: uid)
              .get()
              .then((value) {
            Map<String, dynamic> object =
                value.docs.first.data() as Map<String, dynamic>;
            localRepositoryInterFace.saveUser(UserModel(
                phone: object['phone'] ?? '',
                emailVerified: object['emailVerified'] ?? false,
                createdAt: object['createdAt'].toDate() ?? '',
                username: object['username'] ?? '',
                emailId: object['emailId'] ?? '',
                profileImage: object['profileImage'] ?? '',
                userId: object['userId'] ?? ''));
            localRepositoryInterFace.writeOnBoardingPageLoaded();
            Get.offNamed(Routes.homeScreen);
          });
        } else {
          Get.back();
          Get.focusScope?.unfocus();
          Fluttertoast.showToast(
              msg: 'PLease Check Your Email and Verified EmailID');
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
      } else if (e.code == 'wrong-password') {}
    }
  }
}
