import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  //浮动导航开关
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


  RxList swiperList = [
    {
      "url":"https://www.itying.com/images/focus/focus02.png",
    },
    {
      "url":"https://www.itying.com/images/focus/focus02.png",
    }
  ].obs;

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
