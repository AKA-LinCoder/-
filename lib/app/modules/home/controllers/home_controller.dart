import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi/app/models/focus_model.dart';

import '../../../models/category_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  //浮动导航开关
  RxBool flag = false.obs;
  //轮播图item
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> bestCateList = <CategoryItemModel>[].obs;
  @override
  void onInit() {
    super.onInit();

    scrollControllerListener();
    ///请求接口
    getFocusData();
    getCategoryData();

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
    List value = res.data["result"];
    swiperList.value = value.map((e) => FocusItemModel.fromJson(e)).toList();
    update();
  }

  getCategoryData()async{
    var res = await Dio().get("https://xiaomi.itying.com/api/bestCate");
    List value = res.data["result"];
    bestCateList.value = value.map((e) => CategoryItemModel.fromJson(e)).toList();
    update();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
}
