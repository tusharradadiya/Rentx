import 'package:get/get.dart';
import 'package:rentx/app/domain/repository/local_repository_interface.dart';

class InitialBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut<LocalRepositoryInterFace>(() => LocalRepositoryInterFace());
  }

}