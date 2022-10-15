import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_app/constants.dart';
import 'package:test_project_app/controller/categories_scroller_controller.dart';

class CategoriesScroller extends StatelessWidget {

  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    if(controller.checkValues.isEmpty){
      controller.initValues(3);
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff43343d), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(()=>
                         Transform.scale(
                           scale: 1.5,
                           child: Checkbox(
                            checkColor: Colors.white,
                             side: MaterialStateBorderSide.resolveWith(
                                   (states) => BorderSide(width: 1.0, color: Colors.white),
                             ),
                            // fillColor: MaterialStateProperty.resolveWith((states) => null),
                            // fillColor: Color(0xff3e2f38),
                            fillColor: MaterialStateProperty.all<Color>(Color(0xff3e2f38)),
                            value: controller.checkValues[0],
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              print("ontap $value");
                              // if(value!){
                              //   for(int index = 0; index<controller.checkValues.length; index++){
                              //     controller.checkValues[index]  = false;
                              //   }
                              //   controller.checkValues[0] = value;
                              // }else{
                              //   controller.checkValues[0]  = true;
                              // }
                              controller.updateIndexValue(0, value);
                            },
                        ),
                         ),
                      ),
                      Text(
                        "\u{20B9}${Constants().categoryData[0].first} /mo",
                        // "\u{20B9}2828 /mo",
                        style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "for ${Constants().categoryData[0].last} months",
                        // "for 3 months",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "See calculations",
                        style: TextStyle(fontSize: 10, color: Color(0xff72626b), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff7b7390), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() =>
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                checkColor: Colors.white,
                                side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(width: 1.0, color: Colors.white),
                                ),
                                // fillColor: MaterialStateProperty.resolveWith((states) => null),
                                // fillColor: Color(0xff3e2f38),
                                fillColor: MaterialStateProperty.all<Color>(Color(0xff3e2f38)),
                                value: controller.checkValues[1],
                                shape: const CircleBorder(),
                                onChanged: (bool? value) {
                                  // print("ontap $value");
                                  // controller.checkValues[1] = value!;
                                  // if(value!){
                                  //   for(int index = 0; index<controller.checkValues.length; index++){
                                  //     controller.checkValues[index]  = false;
                                  //   }
                                  // }else{
                                  //   controller.checkValues[0]  = true;
                                  // }
                                  // controller.checkValues[1] = value;

                                  controller.updateIndexValue(1, value);
                                },
                              ),
                            ),
                        ),
                        Text(
                          "\u{20B9}${Constants().categoryData[1].first} /mo",
                          // "\u{20B9}4298 /mo",
                          style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Text(
                          "for ${Constants().categoryData[1].last} months",
                          // "for 6 months",
                          style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "See calculations",
                          style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 160,
                margin: const EdgeInsets.only(right: 10),
                height: 170,
                decoration: const BoxDecoration(color: Color(0xff59698b), borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() =>
                          Transform.scale(
                            scale: 1.5,
                            child: Checkbox(
                              checkColor: Colors.white,
                              side: MaterialStateBorderSide.resolveWith(
                                    (states) => BorderSide(width: 1.0, color: Colors.white),
                              ),
                              // fillColor: MaterialStateProperty.resolveWith((states) => null),
                              // fillColor: Color(0xff3e2f38),
                              fillColor: MaterialStateProperty.all<Color>(Color(0xff3e2f38)),
                              value: controller.checkValues[2],
                              shape: const CircleBorder(),
                              onChanged: (bool? value) {
                                print("ontap $value");
                                // controller.checkValues.removeRange(0, 2);
                                // if(value!){
                                //   for(int index = 0; index<controller.checkValues.length; index++){
                                //     controller.checkValues[index]  = false;
                                //   }
                                // }else{
                                //   controller.checkValues[0]  = true;
                                // }
                                // controller.checkValues[2] = value;
                                controller.updateIndexValue(2, value);
                              },
                            ),
                          ),
                      ),
                      Text(
                        "\u{20B9}${Constants().categoryData[2].first} /mo",
                        // "\u{20B9}4297 /mo",
                        style: TextStyle(fontSize: 18, color: Color(0xfff9f0f7), fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "for ${Constants().categoryData[2].last} months",
                        // "for 12 months",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "See calculations",
                        style: TextStyle(fontSize: 10, color: Color(0xffb1a7b0), fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
