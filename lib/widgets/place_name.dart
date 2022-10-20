import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/controller/globel_controller.dart';

class PlaceName extends StatefulWidget {
  @override
  State<PlaceName> createState() => _PlaceNameState();
}

class _PlaceNameState extends State<PlaceName> {
  String cityName = "";
  String subLocalityName = "";
  String date = DateFormat.yMMMMd().format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getCityName(globalController.getLattitude().value,
        globalController.getLognitude().value);
    // TODO: implement initState
    super.initState();
  }

  Future<void> getCityName(lang, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lang, long);
    var place = placemarks[0];

    cityName = place.locality!;
    subLocalityName = place.subLocality!;
    setState(() {
      cityName = place.locality!;
      subLocalityName = place.subLocality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Text(
            '$cityName',
            style: TextStyle(fontSize: 35, height: 1.5),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            date,
            style:
                TextStyle(color: Colors.grey[700], fontSize: 14, height: 1.5),
          ),
        ),
      ],
    );
  }
}
