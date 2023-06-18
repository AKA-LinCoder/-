import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/product_content_controller.dart';

class ThirdPageView extends GetView {
  @override
  final ProductContentController controller = Get.find();
  ThirdPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(1500),
      color: Colors.orange,
      child: const Center(
        child: Text("我是推荐"),
      ),
    );
  }
}
