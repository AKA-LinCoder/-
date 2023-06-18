import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/modules/productContent/controllers/product_content_controller.dart';

import '../../../services/screen_adapter.dart';

class FirstPageView extends GetView {

  @override
  final ProductContentController controller = Get.find();
  FirstPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk1,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.height(700),
      color: Colors.indigo,
      child: const Center(
        child: Text("我是商品"),
      ),
    );
  }
}
