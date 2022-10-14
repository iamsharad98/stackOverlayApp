import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  var _initialValue = 150000.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SleekCircularSlider(
          appearance: CircularSliderAppearance(
              customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15, handlerSize: 10),
              angleRange: 360,
              size: 250,
              startAngle: 270,
              customColors: CustomSliderColors(
                  trackColor: Color(0xfffceadf),
                  progressBarColor: Color(0xffcd8d74)
              ),
              infoProperties: InfoProperties(
                topLabelText: "credit amount",
                bottomLabelText: "@ 1.04% monthly",
                topLabelStyle: TextStyle(color: Color(0xffafafaf), fontWeight: FontWeight.bold),
                // bottomLabelStyle: TextStyle(color: Color(0xffa3af9b), fontWeight: FontWeight.bold),
                bottomLabelStyle: TextStyle(color: Colors.green[900]!.withOpacity(0.4), fontWeight: FontWeight.bold),
                mainLabelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xff252525),
                ),
                modifier: (double value) {
                  var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
                  final roundedValue = format.format(value);
                  return '$roundedValue';
                },
              )
          ),
          onChange: (value){
            setState(() {
              _initialValue = value;
            });
          },
          min: 0,
          max: 500000,
          initialValue: _initialValue,
          // innerWidget: (var s ){
          //
          // },
        ),
      ),
    );
  }
}
