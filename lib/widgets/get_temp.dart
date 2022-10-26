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
  double? feelsLike;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;
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
      tempMax = (maindata!.tempMax! - 272);
      tempMin = (maindata!.tempMin! - 272);
      pressure = maindata!.pressure;
      humidity = maindata!.humidity;
    }

    return Container(
        child: Row(
      children: [
        Column(
          children: [Text('Temp'), Text(tempe.toString())],
        ),
        Column(
          children: [Text('TempMax'), Text(tempMax.toString())],
        ),
        Column(
          children: [Text('TempMin'), Text(tempMin.toString())],
        ),
      ],
    ));
  }
}
