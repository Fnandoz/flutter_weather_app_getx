import 'package:get/get.dart';
import 'package:weather_app_getx/module/home_controller.dart';
import 'package:weather_app_getx/repository/weather_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WeatherRepository());
    Get.lazyPut(() => HomeController());
  }

}
