import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.orange,
        iconSize: 25,
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          controller.setCurrentIndex(index);
          controller.pageController.jumpToPage(index);
        },
        items:  [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(icon: const Icon(Icons.category), label: "category".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.room_service), label: "service".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_cart), label: "cart".tr),
          BottomNavigationBarItem(icon: const Icon(Icons.people), label: "user".tr),
        ],
      ),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.setCurrentIndex,
        children: controller.pages,
      ),
    ));
  }
}
