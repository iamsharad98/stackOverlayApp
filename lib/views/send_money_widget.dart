import 'package:flutter/material.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../controller/home_page_controller.dart';


class SendMoneyWidget extends StatelessWidget {
  SendMoneyWidget({Key? key}) : super(key: key);

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      // offset: Offset(0, -500),
      offset: Offset(0, 0),
      transformHitTests: false,
      child: Container(
        height: 500,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
              color: const Color(0xff272a3d), boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
              ]),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "where should we send the money?",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, color: Color(0xff919caf), fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: (){
                      print("amount will be credited");
                    },
                    child: const Text(
                      "amount will be credited to this bank account. EMI will also be debited from this bank account",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 12, color: Color(0xff4d5466), fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  ListTile(
                    // leading: Icon(Icons.food_bank, color: Color(0xffcbcad7), size: 50,),
                    leading: Image.asset('assets/images/hdfc_logo.png', ),
                    title: Text("HDFC Bank", style: TextStyle(color: Color(0xffcbcad7), fontWeight: FontWeight.bold, fontSize: 16),),
                    subtitle: Text("50100117009192", style: TextStyle(color: Color(0xff5d5f6e), fontWeight: FontWeight.w600, fontSize: 12),),
                    trailing: Icon(Icons.check_circle, color: Color(0xffcbcad7),),
                    onTap: (){
                      print("ontap listtile");
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (){
                      print("ontap container");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xff8a96a6),
                              width: 2,
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(25))
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(onTap: (){
                            print("text ontap");},
                              child: Text("Change account", style: TextStyle(color: Color(0xff8a96a6), fontWeight: FontWeight.bold),)),
                        )
                    ),
                  ),
                ],
              )
          )),
    );
    // return Card(
    //   child: InkWell(
    //     onTap: (){
    //       print("ontap inkwell");
    //     },
    //     child: Container(
    //       height: 500,
    //       width: MediaQuery.of(context).size.width,
    //     ),
    //   ),
    // );
  }
}
