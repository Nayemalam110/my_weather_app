import 'package:my_weather_app/model/weather_data_current.dart';

class WeatherData {
  WeatherDataCurrent? current;
  WeatherData([this.current]);

  WeatherDataCurrent getCurrentWeather() => current!;
}
