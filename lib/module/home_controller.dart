import 'package:get/get.dart';
import 'package:weather_app_getx/data/location_data.dart';
import 'package:weather_app_getx/repository/weather_repository.dart';

import '../data/weather_data.dart';

class HomeController extends GetxController {
  final WeatherRepository _repository = Get.find();

  Rxn<LocationData> locationData = Rxn();
  Rxn<WeatherData> weatherData = Rxn();

  String get address =>
    "${locationData.value?.regionName}, ${locationData.value?.country}";
  String get temperature => "${weatherData.value?.temp}";
  RxString infoText = '...'.obs;

  void onInit() async {
    super.onInit();
    await getCurrentLocation();
    await getTemperatureForCurrentLocation();
  }

  getCurrentLocation() async {
    LocationData? location = await _repository.getCurrentLocation();
    print(location?.regionName);
    locationData.value = location;
  }

  getTemperatureForCurrentLocation() async {
    if (locationData.value != null) {
      weatherData.value = await _repository.getWeatherForLocation(locationData.value!);
      _getInfoText(weatherData.value?.temp);
    }
  }

  void _getInfoText(int? temperature) {
    if (temperature == null) {
      infoText.value = "Unknown!";
    } else if (temperature <= 0) {
      infoText.value =
      "Make sure to dress in warm clothes🧥!It's freezing out there!❄️";
    } else if (temperature <= 15) {
      infoText.value = "Put on a jacket so you don't get sick! 🧥🤧";
    } else {
      infoText.value = "Savor the weather, it's lovely! ☀️😊";
    }
  }
}