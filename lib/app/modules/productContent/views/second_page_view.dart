import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/product_content_controller.dart';

class SecondPageView extends GetView {
  final ProductContentController controller = Get.find();
  final Function subHeader;
  SecondPageView(this.subHeader,{Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      // height: ScreenAdapter.height(1500),
      // color: Colors.deepOrangeAccent,
      child: Obx(()=> controller.pcontent.value.content!=null?Column(
        children: [
          subHeader(),

          controller.selectedSubTabsIndex.value==1?SizedBox(
              width: ScreenAdapter.width(1080),
              child: Html(
                data: controller.pcontent.value.content,
                style: {
                  "body":Style(
                      backgroundColor: Colors.white
                  ),
                  "p":Style(
                      fontSize: FontSize.large
                  ),
                },
              )
          ):SizedBox(
            width: ScreenAdapter.width(1080),
            child: Html(
              data: controller.pcontent.value.specs,
              style: {
                "body":Style(
                    backgroundColor: Colors.white
                ),
                "p":Style(
                    fontSize: FontSize.large
                ),
              },
            ),
          )
        ],
      ):const Text("")),
    );
  }
}
