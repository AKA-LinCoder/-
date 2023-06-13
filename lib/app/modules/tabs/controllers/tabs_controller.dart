import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi/app/modules/cart/views/cart_view.dart';
import 'package:xiaomi/app/modules/category/views/category_view.dart';
import 'package:xiaomi/app/modules/give/views/give_view.dart';
import 'package:xiaomi/app/modules/home/views/home_view.dart';
import 'package:xiaomi/app/modules/user/views/user_view.dart';

class TabsController extends GetxController {
  //TODO: Implement TabsController


  final currentIndex = 1.obs;
  final PageController pageController = PageController(initialPage: 1);
  final pages = const [
    HomeView(),
    CategoryView(),
    GiveView(),
    CartView(),
    UserView(),
  ];
  @override
  void onInit() {
    super.onInit();
  }



  @override
  void onClose() {
    super.onClose();
  }


  setCurrentIndex(int index){
    currentIndex.value = index;
    update();
  }
}
