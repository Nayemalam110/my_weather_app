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
    var sunset = DateTime.fromMillisecondsSinceEpoch(
        weatherDataCurrent.current.sunset! * 1000);

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
            Text('SunRise:${sunrise}'),
            Text('SunSet:${sunset}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                    'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png'),
                Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                        'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png'),
                    Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                        'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png'),
                    Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                        'assets/weather/${weatherDataCurrent.current.weather![0].icon}.png'),
                    Text(weatherDataCurrent.current.temp!.toStringAsFixed(0)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
