import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/controller/globel_controller.dart';

import 'package:my_weather_app/widgets/get_temp.dart';
import 'package:my_weather_app/widgets/place_name.dart';

import '../widgets/current_data_widget.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    var tempa = 0;

    return Scaffold(
        body: SafeArea(
      child: Obx(() => globalController.checkLoading().isTrue
          ? Center(
              child: Text('Loading'),
            )
          : ListView(
              children: [
                PlaceName(),
                GetTemp(),
                CurrentDataWidget(),
              ],
            )),
    ));
  }
}
