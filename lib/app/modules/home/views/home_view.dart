import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/echo_fonts.dart';
import 'package:xiaomi/app/services/keep_alive_wrapper.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ///顶部导航
    Widget getAppBar() {
      return Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: Obx(() => AppBar(
                //appBar透明
                backgroundColor:
                    controller.flag.value ? Colors.white : Colors.transparent,
                elevation: 0,
                title: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: controller.flag.value
                      ? ScreenAdapter.width(800)
                      : ScreenAdapter.width(620),
                  height: ScreenAdapter.height(96),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey[400],
                            ),
                            Text(
                              "手机",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ScreenAdapter.fontSize(40)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.settings_overscan,
                          color: Colors.grey[400],
                        )
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                leadingWidth:
                    controller.flag.value ? 0 : ScreenAdapter.width(140),
                leading: controller.flag.value
                    ? Container()
                    : IconButton(
                        onPressed: () {},
                        icon: const Icon(EchoFonts.xiaomi),
                      ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: controller.flag.value
                            ? Colors.black87
                            : Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: controller.flag.value
                            ? Colors.black87
                            : Colors.white,
                      )),
                ],
              )));
    }

    ///内容区域
    Widget getHomePage(){
      return Positioned(
        top: -ScreenAdapter.height(180),
        right: 0,
        bottom: 0,
        left: 0,
        ///"https://www.itying.com/images/focus/focus02.png"
        child: ListView(
          controller: controller.scrollController,
          children: [
            SizedBox(
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(682),
              child: Swiper(
                itemCount: controller.swiperList.length,
                itemBuilder: (context,index){
                  return Image.network(controller.swiperList.value[index]["url"],fit: BoxFit.fill,);
                },
                pagination: const SwiperPagination(
                  builder: SwiperPagination.rect
                ),
                autoplay: true,
                loop: true,
                duration: 1000,
              ),
            )
          ],
        ),
      );
    }

    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            getHomePage(),
            getAppBar()
          ],
        ),
      ),
    );
  }
}
