import 'package:get/get.dart';
import 'package:rentx/app/screen/sign_up/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }

}