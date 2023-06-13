import 'package:dio/dio.dart';
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

    scrollControllerListener();
    ///请求接口
    getFocusData();

  }

  scrollControllerListener(){
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

  getFocusData()async{
    var res = await Dio().get("https://xiaomi.itying.com/api/focus");
    swiperList.value = res.data["result"];
    update();
  }

  RxList swiperList = [
  ].obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }






}
