import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi/app/models/focus_model.dart';

import '../../../models/category_model.dart';
import '../../../models/plist_model.dart';
import '../../../services/https_client.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  ScrollController scrollController = ScrollController();
  //浮动导航开关
  RxBool flag = false.obs;
  //轮播图item
  RxList<FocusItemModel> swiperList = <FocusItemModel>[].obs;
  RxList<CategoryItemModel> bestCateList = <CategoryItemModel>[].obs;
  RxList<PlistItemModel> sellingPlist = <PlistItemModel>[].obs;
  RxList<PlistItemModel> bestPlist = <PlistItemModel>[].obs;
  RxList<FocusItemModel> bestSellingSwiperList = <FocusItemModel>[].obs;
  HttpsClient httpsClient = HttpsClient();
  @override
  void onInit() {
    super.onInit();

    scrollControllerListener();
    ///请求接口
    getFocusData();
    getCategoryData();
    //获取热销臻选里面的轮播图
    getSellingSwiperData();
    //获取热销臻选里面的商品
    getSellingPlistData();
    // 获取热门商品
    getBestPlistData();

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

  //获取热销臻选里面的轮播图
  getSellingSwiperData() async {
    var response = await httpsClient.get("api/focus?position=2");
    if (response != null) {
      var sellingSwiper = FocusModel.fromJson(response.data);
      bestSellingSwiperList.value = sellingSwiper.result!;
      update();
    }
  }

//获取热销臻选里面的商品数据
  getSellingPlistData() async {
    var response = await httpsClient.get("api/plist?is_hot=1&pageSize=3");
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      sellingPlist.value = plist.result!;
      update();
    }
  }


  //获取热门商品数据
  getBestPlistData() async {
    var response = await httpsClient.get("api/plist?is_best=1");
    if (response != null) {
      var plist = PlistModel.fromJson(response.data);
      bestPlist.value = plist.result!;
      update();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }
}
