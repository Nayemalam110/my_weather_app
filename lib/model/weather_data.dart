import 'package:my_weather_app/model/weather_data_current.dart';
import 'package:my_weather_app/model/weather_data_hourly.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherDataHourly? hourly;
  WeatherData([this.current, this.hourly]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
}
