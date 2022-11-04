import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_data_current.dart';

class CurrentDataWidget extends StatelessWidget {
  WeatherDataCurrent weatherDataCurrent;

  CurrentDataWidget(this.weatherDataCurrent);

  @override
  Widget build(BuildContext context) {
    print(weatherDataCurrent);
    return Container(
      child: Text(weatherDataCurrent.current.temp.toString()),
    );
  }
}
