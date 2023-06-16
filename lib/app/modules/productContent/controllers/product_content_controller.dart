import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/https_client.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController


  //顶部tab切换
  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];
  RxInt selectedTabsIndex = 1.obs;
  RxDouble opacity = 0.0.obs;
  //是否显示顶部tabs
  RxBool showTabs = false.obs;
  ScrollController scrollController = ScrollController();
  HttpsClient httpsClient = HttpsClient();
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();



  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if(scrollController.position.pixels<=100&&scrollController.position.pixels>=0){
        opacity.value = scrollController.position.pixels/100;
        if(showTabs.value){
          showTabs.value = false;
        }
      }else{
        if(!showTabs.value&&scrollController.position.pixels>=0){
            showTabs.value = true;
        }
      }
      update();
    });
  }

}
