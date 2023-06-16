import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/product_content_controller.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({Key? key}) : super(key: key);
  
  appBarTitle(String title){
    return  Padding(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(fontSize: ScreenAdapter.fontSize(40)),),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.height(10)),
            height: ScreenAdapter.height(4),
            width: ScreenAdapter.width(100),
            color: Colors.orange,
          )
        ],
      ),
    );
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body内容拓展到appBar下
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(ScreenAdapter.height(1080),ScreenAdapter.height(96)
        ),
        child:Obx(() =>  AppBar(
          backgroundColor: Colors.white.withOpacity(controller.opacity.value),
          elevation: 0,
          title: Container(
              alignment: Alignment.center,
              width: ScreenAdapter.width(400),
              height: ScreenAdapter.height(96),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appBarTitle("商品"),

                  appBarTitle("详情"),

                  appBarTitle("推荐")
                ],
              )),
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
                  child: Icon(Icons.file_upload_outlined)),
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
      body: ListView(
        controller: controller.scrollController,
        children:  [
          Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.height(400),
            color: Colors.indigo,
          ),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
          ListTile(title: Text("我是你爹"),),
        ],
      ),
    );
  }
}
