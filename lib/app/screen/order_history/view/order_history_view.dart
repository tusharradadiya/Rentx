import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:rentx/app/routes/app_page.dart';
import 'package:rentx/app/screen/order_history/controller/order_history_controller.dart';

class OrderHistoryView extends GetWidget<OrderHistoryController> {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Order History'),
        leading: GestureDetector(
            onTap: () {
              Get.offNamed(Routes.homeScreen);
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Column(
        children: const [],
      )),
    );
  }
}
