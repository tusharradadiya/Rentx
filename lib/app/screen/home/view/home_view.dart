import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rentx/app/screen/home/controller/home_controller.dart';

class HomeView extends GetWidget<HomeController>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('RentX'),
      ),
    );
  }

}