import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [Text('Temp'), Text(tempe.toStringAsFixed(0))],
            ),
            Column(
              children: [Text('TempMax'), Text(tempMax!.toStringAsFixed(0))],
            ),
            Column(
              children: [Text('TempMin'), Text(tempMin!.toStringAsFixed(0))],
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [Text('pressure'), Text(pressure!.toStringAsFixed(0))],
            ),
            Column(
              children: [Text('humidity'), Text(humidity!.toStringAsFixed(0))],
            ),
          ],
        ),
      ],
    ));
  }
}
