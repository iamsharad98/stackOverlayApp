import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:test_project_app/controller/sleek_slider_controller.dart';
import '../controller/home_page_controller.dart';

class AddMoneyToWallet extends StatelessWidget {
  AddMoneyToWallet({Key? key}) : super(key: key);

  final HomePageController homePageController = Get.put(HomePageController());
  final SleekSliderController sliderController = Get.put(SleekSliderController());

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.currency(locale: 'HI', symbol: "\u{20B9}");
    return Container(
      height: 500,
      //   height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
            color: const Color(0xff161921), boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Obx((){
            if(homePageController.itemsDataFilling.length == 1){
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "nikunj, how much do you need?",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Color(0xff8998a6), fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "move the dial and set any amount you need upto \n\u{20B9}4,87,891",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12, color: Color(0xff414551), fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Obx((){
                        if(homePageController.itemsDataFilling.length != 1) {
                          return const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 35,);
                        }
                        return Container();
                      })
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        color: const Color(0xffffffff), boxShadow: [
                          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
                        ]),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Obx(()=>SleekCircularSlider(
                          appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(progressBarWidth: 15, trackWidth: 15, handlerSize: 10),
                              angleRange: 360,
                              size: 250,
                              startAngle: 270,
                              customColors: CustomSliderColors(
                                  trackColor: const Color(0xfffceadf),
                                  progressBarColor: const Color(0xffcd8d74),
                                  dotColor: const Color(0xff2e2d30)
                              ),
                              infoProperties: InfoProperties(
                                topLabelText: "credit amount",
                                bottomLabelText: "@ 1.04% monthly",
                                topLabelStyle: const TextStyle(color: Color(0xffafafaf), fontWeight: FontWeight.bold),
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
                          min: 0,
                          max: 500000,
                          initialValue: sliderController.initialSliderValue.value,
                          onChange: (value){
                            sliderController.changeSliderValue(value);
                          },
                        ),),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: (){
                            print("ontap stash");
                          },
                          child: const Text(
                            "stash is instant. money will be credited within\nseconds.",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Color(0xffcccecd), fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "credit amount",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, color: Color(0xff8998a6), fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${format.format(sliderController.initialSliderValue.value)}",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 20, color: Color(0xff414551), fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Obx((){
                      if(homePageController.itemsDataFilling.length != 1) {
                        return const Icon(Icons.arrow_drop_down, color: Colors.grey, size: 35,);
                      }
                      return Container();
                    })
                  ],
                ),
              ],
            );
          })
        ));
  }
}
