import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/echo_fonts.dart';
import 'package:xiaomi/app/services/keep_alive_wrapper.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../../../services/https_client.dart';
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

    Widget swiper() {
      return SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(682),
        child: Obx(() => Swiper(
              itemCount: controller.swiperList.length,
              itemBuilder: (context, index) {
                String picUrl =
                    "https://xiaomi.itying.com/${controller.swiperList.value[index].pic}";

                return Image.network(
                  picUrl.replaceAll("\\", "/"),
                  fit: BoxFit.fill,
                );
              },
              pagination:
                  const SwiperPagination(builder: SwiperPagination.rect),
              autoplay: true,
              loop: true,
              duration: 1000,
            )),
      );
    }


    Widget getBanner2(){
      return Obx(() => SizedBox(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.height(470),
        child: Swiper(
          itemCount: (controller.bestCateList.length) ~/ (10),
          itemBuilder: (context, index) {
            return GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: ScreenAdapter.width(20),
                    mainAxisSpacing: ScreenAdapter.height(20)
                ),
                itemBuilder: (context, i) {
                  String picUrl =
                      "https://xiaomi.itying.com/${controller.bestCateList.value[index*10+i].pic}";
                  return Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: ScreenAdapter.height(140),
                          width: ScreenAdapter.height(140),
                          child: Image.network(
                            picUrl.replaceAll("\\", "/"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(0, ScreenAdapter.height(4), 0, 0),
                        child: Text(controller.bestCateList.value[index*10+i].title??'',style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),),
                      )
                    ],
                  );
                });
          },
          pagination:
          const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          loop: true,
          duration: 1000,
        ),
      ));
    }


    ///热销臻选
    Widget bestSelling() {
      return Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(30),
                  ScreenAdapter.height(40),
                  ScreenAdapter.width(30),
                  ScreenAdapter.height(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("热销臻选",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenAdapter.fontSize(46))),
                  Text("更多手机推荐 >",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
                ],
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0,
                ScreenAdapter.width(20), ScreenAdapter.height(20)),
            child: Row(
              children: [
                //左侧
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: ScreenAdapter.height(738),
                      child: Obx(() => Swiper(
                          itemBuilder: (context, index) {
                            return Image.network(
                              HttpsClient.replaceUri(
                                  controller.bestSellingSwiperList[index].pic),
                              fit: BoxFit.fill,
                            );
                          },
                          itemCount: controller.bestSellingSwiperList.length,
                          autoplay: true,
                          loop: true,
                          pagination: SwiperPagination(
                              margin: const EdgeInsets.all(0.0),
                              builder: SwiperCustomPagination(builder:
                                  (BuildContext context,
                                  SwiperPluginConfig config) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints.expand(
                                      height: ScreenAdapter.height(36)),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:
                                          const RectSwiperPaginationBuilder(
                                            color: Colors.black12,
                                            activeColor: Colors.black54,
                                          ).build(context, config),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })))),
                    )),
                SizedBox(width: ScreenAdapter.width(20)),
                //右侧
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: ScreenAdapter.height(738),
                      child: Obx(() => Column(
                          children: controller.sellingPlist
                              .asMap()
                              .entries
                              .map((entries) {
                            var value = entries.value;
                            return Expanded(
                                flex: 1,
                                child: Container(
                                  color: const Color.fromRGBO(246, 246, 246, 1),
                                  margin: EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      entries.key == 2
                                          ? 0
                                          : ScreenAdapter.height(20)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: ScreenAdapter.height(20)),
                                            Text("${value.title}",
                                                style: TextStyle(
                                                    fontSize:
                                                    ScreenAdapter.fontSize(
                                                        38),
                                                    fontWeight: FontWeight.bold)),
                                            SizedBox(
                                                height: ScreenAdapter.height(20)),
                                            Text("${value.subTitle}",
                                                style: TextStyle(
                                                    fontSize:
                                                    ScreenAdapter.fontSize(
                                                        28))),
                                            SizedBox(
                                                height: ScreenAdapter.height(20)),
                                            Text("￥${value.price}元",
                                                style: TextStyle(
                                                    fontSize:
                                                    ScreenAdapter.fontSize(
                                                        34)))
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              ScreenAdapter.height(8)),
                                          child: Image.network(
                                              HttpsClient.replaceUri(value.pic),
                                              fit: BoxFit.cover),
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }).toList())),
                    )),
              ],
            ),
          )
        ],
      );
    }

    Widget bestGoods() {
      return Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(30),
                  ScreenAdapter.height(40),
                  ScreenAdapter.width(30),
                  ScreenAdapter.height(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("省心优惠",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenAdapter.fontSize(46))),
                  Text("全部优惠 >",
                      style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
                ],
              )),
          Obx(() => Container(
            padding: EdgeInsets.all(ScreenAdapter.width(26)),
            color: const Color.fromRGBO(246, 246, 246, 1),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: ScreenAdapter.width(26),
              crossAxisSpacing: ScreenAdapter.width(26),
              itemCount: controller.bestPlist.length, //注意
              shrinkWrap: true, //收缩，让元素宽度自适应
              physics: const NeverScrollableScrollPhysics(), //禁止滑动
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Get.toNamed("/product-content",arguments: {
                      "id":controller.bestPlist[index].sId
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(ScreenAdapter.width(20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          child: Image.network(
                            HttpsClient.replaceUri(
                                controller.bestPlist[index].sPic),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          width: double.infinity,
                          child: Text(
                            "${controller.bestPlist[index].title}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(42),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          width: double.infinity,
                          child: Text(
                            "${controller.bestPlist[index].subTitle}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(ScreenAdapter.width(10)),
                          width: double.infinity,
                          child: Text(
                            "¥${controller.bestPlist[index].price}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: ScreenAdapter.fontSize(32),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      );
    }


    // Widget bestGoods(){
    //   return Column(
    //     children: [
    //       Padding(
    //           padding: EdgeInsets.fromLTRB(
    //               ScreenAdapter.width(30),
    //               ScreenAdapter.height(40),
    //               ScreenAdapter.width(30),
    //               ScreenAdapter.height(20)),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Text("省心优惠",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: ScreenAdapter.fontSize(46))),
    //               Text("全部优惠 >",
    //                   style: TextStyle(fontSize: ScreenAdapter.fontSize(38)))
    //             ],
    //           )),
    //       Container(
    //         child: MasonryGridView.count(
    //             crossAxisCount: 2,
    //             mainAxisSpacing: ScreenAdapter.width(20),
    //             crossAxisSpacing: ScreenAdapter.width(20),
    //             itemCount: 20,
    //             shrinkWrap: true, //收缩，让宽度自适应
    //             physics: const NeverScrollableScrollPhysics(),
    //             itemBuilder: (context,index){
    //               var height = 50+150*Random().nextDouble();
    //           return Container(
    //             height: height,
    //               decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.yellow,width: 1)
    //               ),
    //               child: const Text("dsda"));
    //         }),
    //       )
    //     ],
    //   );
    // }


    ///内容区域
    Widget getHomePage() {
      return Positioned(
        top: -ScreenAdapter.height(180),
        right: 0,
        bottom: 0,
        left: 0,
        ///"https://www.itying.com/images/focus/focus02.png"
        child: ListView(
          controller: controller.scrollController,
          children: [
            swiper(),
            SizedBox(
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(92),
              child: Image.asset(
                "assets/images/xiaomiBanner.png",
                fit: BoxFit.cover,
              ),
            ),
            getBanner2(),
              Padding(padding: EdgeInsets.fromLTRB(ScreenAdapter.width(20), 0, ScreenAdapter.width(20), 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/xiaomiBanner2.png")
                    )
                  ),
                    height: ScreenAdapter.height(420),
                    ),
              ),
            bestSelling(),
            bestGoods(),
          ],
        ),
      );
    }





    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            getHomePage(),
            getAppBar(),
          ],
        ),
      ),
    );
  }
}
