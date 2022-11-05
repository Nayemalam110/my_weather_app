import 'dart:convert';

import 'package:my_weather_app/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:my_weather_app/model/weather_data_current.dart';

import 'api_key.dart';

class FeachWeathrApi {
  WeatherData? weatherData;
  Future<WeatherData?> proscessData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
      WeatherDataCurrent.fromJson(jsonString),
    );
    return weatherData;
  }
}

String apiURL(lat, lon) {
  String url;
  url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";

  return url;
}
