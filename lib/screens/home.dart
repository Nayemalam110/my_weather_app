import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controller/globel_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? Center(
              child: Text('Loading'),
            )
          : Center(
              child: Text('Not loading'),
            )),
    ));
  }
}
