import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../../category/controllers/category_controller.dart';
import '../../give/controllers/give_controller.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/tabs_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(
      () => TabsController(),
    );
    //当从详情页到购物车返回后，会销毁
    // Get.lazyPut<CartController>(
    //   () => CartController(),
    // );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<GiveController>(
      () => GiveController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
