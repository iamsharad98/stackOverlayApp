import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SleekSliderController extends GetxController {
  var initialSliderValue = 150000.0.obs;

  changeSliderValue(value)=>initialSliderValue.value= value;
}