import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WeatherItem extends StatelessWidget {
  final String text;
  final String subText;
  final String lottie;

  const WeatherItem(
      {super.key,
      required this.text,
      required this.subText,
      required this.lottie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .5,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset(lottie, height: 90, fit: BoxFit.cover),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: text,
                      style:
                          GoogleFonts.ubuntu(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(
                            text: subText,
                            style:
                                GoogleFonts.ubuntu(fontWeight: FontWeight.bold))
                      ]),
                )
              ]),
        ),
      ),
    );
  }
}
