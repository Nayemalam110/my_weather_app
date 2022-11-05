import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/model/weather_data_current.dart';

class CurrentDataWidget extends StatelessWidget {
  WeatherDataCurrent weatherDataCurrent;

  CurrentDataWidget(this.weatherDataCurrent);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime;
    print(weatherDataCurrent.current);

    var sunrise = DateTime.fromMillisecondsSinceEpoch(
        weatherDataCurrent.current.sunrise! * 1000);
    var sunset =
        DateTime.fromMicrosecondsSinceEpoch(weatherDataCurrent.current.sunset!);

    return Container(
      child: Column(
        children: [
          Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
          Text('SunRise:${sunrise}'),
          Text('SunSet:${sunset}'),
        ],
      ),
    );
  }
}
