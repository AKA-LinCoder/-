import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  RxBool flag = false.obs;
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels>10&&scrollController.position.pixels<20){
        if(flag.value == false){
          flag.value = true;
          update();
        }

      }
      if(scrollController.position.pixels<10){
        if(flag.value == true){
          flag.value = false;
          update();
        }
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
