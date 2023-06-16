import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);


  ///@title appBarTitle
  ///@description appbar标题
  ///@param: title
  ///@param: id
  ///@return: Widget
  ///@updateTime 2023/6/16 15:58
  ///@author LinGuanYu
  Widget appBarTitle(String title,int id){

    return  GestureDetector(
      onTap: (){
       changeSelectedTabIndex(id);
      },
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),),
            Container(
              margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
              height: ScreenAdapter.height(4),
              width: ScreenAdapter.width(100),
              color: controller.selectedTabsIndex.value==id?Colors.orange:Colors.transparent,
            )
          ],
        ),
      ),
    );
  }

  changeSelectedTabIndex(int index){
    controller.selectedTabsIndex.value = index;
    //跳转到指定的容器
    if(index==1){
      Scrollable.ensureVisible(controller.gk1.currentContext as BuildContext);
    }else if(index==2){
      Scrollable.ensureVisible(controller.gk2.currentContext as BuildContext);
    }else{
      Scrollable.ensureVisible(controller.gk3.currentContext as BuildContext);
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body内容拓展到appBar下
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(ScreenAdapter.height(1080),ScreenAdapter.height(120)
        ),
        child:Obx(() =>  AppBar(
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          elevation: 0,
          title: Container(
              alignment: Alignment.center,
              width: ScreenAdapter.width(400),
              height: ScreenAdapter.height(96),
              child: controller.showTabs.value?Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: controller.tabsList.map((e) => appBarTitle(e["title"], e["id"])).toList(),
              ):const Text("")),
          centerTitle: true,
          //leading 默认高度是appbar的高,解决办法给外层一个空的container，让真正的元素作为child
          leading: Container(
            // color: Colors.red,
            alignment: Alignment.center,
            child: SizedBox(
              width: ScreenAdapter.width(100),
              height: ScreenAdapter.width(100),
              child: ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    //button里面有默认的边距 得去掉才能居中
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Icon(Icons.arrow_back_ios_new_outlined)),
            ),
          ),
          actions: [
            SizedBox(
              width: ScreenAdapter.width(100),
              height: ScreenAdapter.width(100),
              child: ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    //button里面有默认的边距 得去掉才能居中
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Icon(Icons.file_upload_outlined)),
            ),
            SizedBox(width: ScreenAdapter.width(30),),
            SizedBox(
              width: ScreenAdapter.width(100),
              height: ScreenAdapter.width(100),
              child: ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    //button里面有默认的边距 得去掉才能居中
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(Colors.black12),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: Icon(Icons.more_horiz_outlined)),
            ),
            SizedBox(width: ScreenAdapter.width(20),),
          ],
        )),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child:  Column(
          children: [
            Container(
              key: controller.gk1,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(700),
              color: Colors.indigo,
              child: const Center(
                child: Text("我是商品"),
              ),
            ),

            Container(
              key: controller.gk2,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(1500),
              color: Colors.deepOrangeAccent,
              child: const Center(
                child: Text("我是详情"),
              ),
            ),

            Container(
              key: controller.gk3,
              width: ScreenAdapter.width(1080),
              height: ScreenAdapter.height(1500),
              color: Colors.orange,
              child: const Center(
                child: Text("我是推荐"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
