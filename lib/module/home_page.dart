import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_getx/module/home_controller.dart';
import '../widgets/weather_item.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.find<HomeController>();

  String formatDate(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat("EEEE dd MMMM yyyy");
    return dateFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        title: Column(
          children: [
            Text("Today",
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w500,
                    fontSize: 30,
                    color: Colors.black)),
            Text(formatDate(DateTime.now()),
                style: GoogleFonts.ubuntu(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.grey)),
          ],
        ),
      ),
      body: SizedBox.expand(
          child: Obx(
        () => _controller.weatherData.value == null
            ? Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: Colors.black, size: 40))
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                WeatherItem(
                    text: "Your location is ",
                    subText: _controller.address,
                    lottie: "assets/loc.json"),
                WeatherItem(
                    text: "The temperature is ",
                    subText: "${_controller.temperature}ºC",
                    lottie: "assets/temp.json"),
                WeatherItem(
                    text: "You should ",
                    subText: _controller.infoText.value,
                    lottie: "assets/thums_up.json"),
              ]),
      )),
    );
  }
}
