import 'package:hive_flutter/hive_flutter.dart';

const USER_BOX = 'User';

class LocalRepositoryInterFace {
  var box = Hive.box(USER_BOX);
  var _is_onboarding_shown = 'ONBOARDINGSHOWN';
  // @override
  // UserModel getUser() {
  //   var user = UserModel(
  //       box.get(_pref_userId) ?? '',
  //       box.get(_pref_username) ?? '',
  //       0,
  //       box.get(_pref_email) ?? '',
  //       box.get(_pref_phone) ?? '',
  //       box.get(_pref_address) ?? '',
  //       box.get(_pref_createdAt) ?? '',
  //       box.get(_isVerified) ?? false,
  //       box.get(_pref_image) ?? '',
  //       box.get(_pref_backgroundImage) ?? '',
  //       box.get(_pref_token) ?? '',
  //       box.get(_pref_latitude) ?? '',
  //       box.get(_pref_longitude) ?? '',
  //       0,
  //       [],
  //       '');
  //   return user;
  // }

  // @override
  // Future<void> saveUser(UserModel user) async {
  //   await box.put(_pref_userId, user.id);
  //   await box.put(_pref_token, user.token);
  //   await box.put(_pref_username, user.name);
  //   await box.put(_pref_email, user.email);
  //   await box.put(_pref_phone, user.phone);
  //   await box.put(_pref_address, user.address);
  //   await box.put(_pref_createdAt, user.createdAt);
  //   await box.put(_isVerified, user.isEmailVerified);
  //   // print(user.toJson());
  //   await box.put(_pref_image, user.imageUrl);
  //   await box.put(_pref_backgroundImage, user.backgroundImage);
  //   await box.put(_pref_latitude, user.latitude);
  //   await box.put(_pref_longitude, user.longitude);
  // }

  // @override
  // String getUserId() {
  //   return box.get(_pref_userId) ?? '';
  // }
  //
  // @override
  // String getUserToken() {
  //   return box.get(_pref_token) ?? '';
  // }
  //
  // @override
  // Future<Product> getWishlist() {
  //   throw UnimplementedError();
  // }
  //
  // @override
  // void saveUserId(String uid) {
  //   // print(uid);
  //   box.put(_pref_userId, uid);
  // }
  //
  // @override
  // void saveUserToken(String token) {
  //   // print(uid);
  //   box.put(_pref_token, token);
  // }
  //
  // @override
  // void clearAllData() {
  //   box.clear();
  // }
  //
  // @override
  // bool getIsPhoneVerified() {
  //   return box.get(_isVerified) ?? false;
  // }
  //
  // @override
  // void savePhoneVerified(bool isPhoneVerified) {
  //   box.put(_isVerified, isPhoneVerified);
  // }
  //
  // @override
  Future<void> writeOnBoardingPageLoaded() async {
    await box.put(_is_onboarding_shown, true);
  }

  //
  // @override
  bool readOnBoardingPageLoaded() {
    return box.get(_is_onboarding_shown) ?? false;
  }
  //
  // @override
  // void eraseBox() {
  //   box.clear();
  //   writeOnBoardingPageLoaded();
  // }
}
