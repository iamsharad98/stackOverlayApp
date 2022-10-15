import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_app/views/home_screen.dart';
import '../views/add_money_widget.dart';
import '../views/repay_money_widget.dart';
import '../views/send_money_widget.dart';

class HomePageController extends GetxController{
  var itemsDataFilling = <Widget>[].obs;
  var itemsDataPopped = <Widget>[].obs;
  var initialSliderValue = 150000.0.obs;
  var toggleBankBool = false.obs;

  addInitialDataToStack(context){
    itemsDataFilling.add(AddMoneyToWallet());
    itemsDataFilling.add(RepayMoneyWidget());
    itemsDataFilling.add(SendMoneyWidget());
  }


  removeAboveStackItem(var index, var animatedListKey){
    if(index == itemsDataFilling.length - 1) return;
    print("removeAboveStackItem: index item ${index} ${itemsDataFilling.length}");
    int i = itemsDataFilling.length -1;
    int tempIndex = itemsDataFilling.length -1;
    while(itemsDataFilling.isNotEmpty && i != index){
      int lastIndex = itemsDataFilling.length -1;
      Widget rem = itemsDataFilling.removeAt(lastIndex);
      // animatedListKey.currentState?.removeItem(lastIndex, (context, animation) =>
      //     HomeScreen().widgetListItem(context, lastIndex , animation),);
      itemsDataPopped.add(rem);
      i--;
    }
    animatedListKey.currentState?.removeItem(tempIndex-1, (context, animation) =>
        HomeScreen().widgetListItem(context, tempIndex-1 , animation),);

  }

  updateBankToggle(var boolValue){
    toggleBankBool.value = boolValue;
  }

}