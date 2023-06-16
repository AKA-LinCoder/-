import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController

  RxDouble opacity = 0.0.obs;
  ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels<=100&&scrollController.position.pixels>=0){
        opacity.value = scrollController.position.pixels/100;
      }
      update();
    });
  }



  @override
  void onClose() {
    super.onClose();
  }

}
