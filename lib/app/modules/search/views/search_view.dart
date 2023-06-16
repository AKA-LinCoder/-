import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/search_services.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Container(
          width: ScreenAdapter.width(800),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            autofocus: true,
            ///修改框框的字体大小
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            onChanged: (text){
              controller.keywords = text;
            },
            //监听键盘的回车事件
            onSubmitted: (text)async{
              //保存搜索记录
              await SearchServices.setHistoryData(text);

              Get.offAndToNamed("/product-list",arguments: {"keywords":text});
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () async{
                //保存搜索记录
                await SearchServices.setHistoryData(controller.keywords);
                //替换路由
                Get.offAndToNamed("/product-list",arguments: {"keywords":controller.keywords});
              },
              child: Text(
                "搜索",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(36)),
              ))
        ],
      ),
      body: Obx(() => ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "搜索历史",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(43)),
              ),
              IconButton(onPressed: ()async{
                Get.bottomSheet(Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  color: Colors.white,
                  width: ScreenAdapter.width(1080),
                  height: ScreenAdapter.height(360),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "您确定要清空历史记录吗?",
                            style: TextStyle(
                                fontSize:
                                ScreenAdapter.fontSize(48)),
                          )
                        ],
                      ),
                      SizedBox(height: ScreenAdapter.height(40)),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: ScreenAdapter.width(420),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        const Color.fromARGB(123, 151,
                                            147, 147)),
                                    foregroundColor:
                                    MaterialStateProperty.all(
                                        Colors.white)),
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("取消")),
                          ),
                          SizedBox(
                              width: ScreenAdapter.width(420),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          const Color.fromARGB(
                                              123,
                                              151,
                                              147,
                                              147)),
                                      foregroundColor:
                                      MaterialStateProperty.all(
                                          Colors.red)),
                                  onPressed: () {
                                    controller.clearHistoryData();
                                    Get.back();
                                  },
                                  child: const Text("确定"))),
                        ],
                      )
                    ],
                  ),
                ));
              }, icon: const Icon(Icons.delete))
            ],
          ),
          Wrap(
              children: controller.historyList
                  .map((value) => GestureDetector(
                onLongPress: () {
                  Get.defaultDialog(
                      title: "提示信息!",
                      middleText: "您确定要删除吗?",
                      confirm: ElevatedButton(
                          onPressed: () {
                            controller.removeHistoryData(value);
                            Get.back();
                          },
                          child: const Text("确定")),
                      cancel: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("取消")));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16),
                      ScreenAdapter.width(32),
                      ScreenAdapter.width(16)),
                  margin: EdgeInsets.all(ScreenAdapter.height(16)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(value),
                ),
              ))
                  .toList()),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "猜你想搜",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(43)),
              ),
              const Icon(Icons.refresh)
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("红米"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机壳"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机"),
              )
            ],
          ),






          //热销商品
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hot_search.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: GridView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: ScreenAdapter.width(40),
                          mainAxisSpacing: ScreenAdapter.height(20),
                          childAspectRatio: 3 / 1),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(ScreenAdapter.width(10)),
                              alignment: Alignment.center,
                              width: ScreenAdapter.width(120),
                              child: Image.network("https://www.itying.com/images/shouji.png"),
                            ),
                            Expanded(child: Padding(
                              padding:  EdgeInsets.all(ScreenAdapter.width(10)),
                              child: Text("小米热水器"),
                            )),
                          ],
                        );
                      }),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
