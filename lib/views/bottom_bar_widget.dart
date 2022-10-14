import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';

class BottomBarWidget extends StatelessWidget {

  BottomBarWidget(this.animatedListKey, {super.key});
  final GlobalKey<AnimatedListState> animatedListKey;
  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<String> bottomText = [
      "Proceed to EMI selection","Select your bank account","Tap for 1-click KYC"
    ];
    return GestureDetector(
      onTap: (){
        print("ontap bottombar");
        if(controller.itemsDataPopped.isEmpty) return;
        controller.itemsDataFilling.add(controller.itemsDataPopped.removeLast());
        animatedListKey.currentState?.insertItem(controller.itemsDataFilling.length-1);
        // setState(() {});
      },
      child:
      // (itemsDataFilling.length >0) ?
      Container(
        height: 70,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)), color: const Color(0xff3a479b), boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
        child:
        // Container()
        Center(child: Obx(()=>Text((controller.itemsDataFilling.isEmpty) ? "" : bottomText[controller.itemsDataFilling.length -1],
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),))),

      )
      // : Container()
      ,
    );
  }
}
