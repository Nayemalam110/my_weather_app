import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_weather_app/model/weathermodel/main.dart';

import '../controller/globel_controller.dart';

class GetTemp extends StatefulWidget {
  @override
  State<GetTemp> createState() => _GetTempState();
}

class _GetTempState extends State<GetTemp> {
  double tempe = 0;
  Main? maindata;

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    maindata = globalController.maindata;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tempe = maindata!.temp!;
    if (tempe != 0) {
      tempe = (tempe - 272);
    }

    return Container(
      child: Text(tempe.toStringAsFixed(2)),
    );
  }
}
