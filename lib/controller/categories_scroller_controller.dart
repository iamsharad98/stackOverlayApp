import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{
  List<bool> checkValues = <bool>[].obs;

  initValues(var size){
    int len = size-1;
    while(len >= 0){
      checkValues.add(false);
      len--;
    }
    checkValues[0] = true;
  }
  updateIndexValue(var index, var value){
    if(index == 0 && !value){
      return;
    }
    if(checkValues[index] && !value) return;
    if(value!){
      for(int i = 0; i<checkValues.length; i++){
        checkValues[i]  = false;
      }
    }else{
      checkValues[0]  = true;
    }
    checkValues[index] = value;
  }
  getPositiveIndex(){
    int checkedIndex = 0;
    // List<bool> checkList = await categoriesController.checkValues;
    List<bool> checkList = checkValues;
    // print("jfjf ${checkList[0]}");
    for(int i = 0; i<checkList.length; i++){
      if(checkList[i]){
        checkedIndex = i;
      }
    }
    return checkedIndex;
  }

}