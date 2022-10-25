import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/weathermodel/main.dart';

class GlobalController extends GetxController {
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;

  RxDouble getLattitude() => _lattitude;
  RxDouble getLognitude() => _longitude;
  Main? maindata;
  @override
  void onInit() {
    if (_isLoading.isTrue) {
      getLocation();
    }
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied sorry');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;

      print(_lattitude);
      print(_longitude);
      return fetchData(_lattitude, _longitude);
    });
  }

//Alternative example

  // Future<WeatherModel> getWeather(String city) async{
  //   final result = await http.Client().get("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2");

  //   if(result.statusCode != 200)
  //     throw Exception();

  //   return parsedJson(result.body);
  // }

  // WeatherModel parsedJson(final response){
  //   final jsonDecoded = json.decode(response);

  //   final jsonWeather = jsonDecoded["main"];

  //   return WeatherModel.fromJson(jsonWeather);
  // }

  Future<void> fetchData(lat, long) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&APPID=010d8469f57ac9801d2f0a9d72e648fc');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception();
      }

      final extertData = json.decode(response.body);

      var extertDatas = extertData['main'];

      maindata = Main.fromJson(extertDatas);
    } catch (e) {
      print('There is an error');
      print(e);
      throw e;
    } finally {
      _isLoading.value = false;
    }
  }
}
