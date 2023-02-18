// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rentx/app/model/user_model.dart';

const USER_BOX = 'User';

class LocalRepositoryInterFace {
  var box = Hive.box(USER_BOX);
  final _is_onboarding_shown = 'ONBOARDINGSHOWN';
  final _pref_userId = 'userId';
  final _pref_username = 'userName';
  final _pref_email = 'email';
  final _pref_image = 'profileImage';
  final _pref_createdAt = 'createdAt';
  final _pref_phone = 'phone';
  final _pref_emailVerified = 'emailVerified';
  UserModel getUser() {
    var user = UserModel(
        userId: box.get(_pref_userId) ?? '',
        username: box.get(_pref_username) ?? '',
        emailId: box.get(_pref_email) ?? '',
        createdAt: box.get(_pref_createdAt) ?? DateTime.now(),
        phone: box.get(_pref_phone) ?? '',
        emailVerified: box.get(_pref_emailVerified) ?? false,
        profileImage: box.get(_pref_image) ?? '');
    return user;
  }

  Future<void> saveUser(UserModel user) async {
    await box.put(_pref_userId, user.userId);
    await box.put(_pref_username, user.username);
    await box.put(_pref_email, user.emailId);
    await box.put(_pref_createdAt, user.createdAt);
    await box.put(_pref_image, user.profileImage);
    await box.put(_pref_phone, user.phone);
    await box.put(_pref_emailVerified, user.emailVerified);
  }

  String getUserId() {
    return box.get(_pref_userId) ?? '';
  }

  void saveUserId(String uid) {
    box.put(_pref_userId, uid);
  }

  Future<void> writeOnBoardingPageLoaded() async {
    await box.put(_is_onboarding_shown, true);
  }

  bool readOnBoardingPageLoaded() {
    return box.get(_is_onboarding_shown) ?? false;
  }

  void clearAllData() {
    box.clear();
  }
}
