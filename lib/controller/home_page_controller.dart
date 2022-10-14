import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../views/add_money_widget.dart';
import '../views/repay_money_widget.dart';
import '../views/send_money_widget.dart';

class HomePageController extends GetxController{
  var itemsDataFilling = <Widget>[].obs;
  var itemsDataPopped = <Widget>[].obs;
  var initialSliderValue = 150000.0.obs;

  addInitialDataToStack(context){
    itemsDataFilling.add(AddMoneyToWallet());
    itemsDataFilling.add(RepayMoneyWidget());
    itemsDataFilling.add(SendMoneyWidget());
  }


  removeAboveStackItem(var index, var animatedListKey){
    print("index item ${index} ${itemsDataFilling.length}");
    int i = itemsDataFilling.length -1;
    while(itemsDataFilling.isNotEmpty && i != index){
      print("itemsDataFilling len ${itemsDataFilling.length} before");

      int lastIndex = itemsDataFilling.length -1;
      Widget rem = itemsDataFilling.removeAt(lastIndex);
      // animatedListKey.currentState?.removeItem(itemsDataFilling.length -1, (context, animation) => _widgetListItem(context, lastIndex , animation),);
      itemsDataPopped.add(rem);
      print("itemsDataFilling len ${itemsDataFilling.length} after");
      i--;
    }
  }

}