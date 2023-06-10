import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/echo_fonts.dart';
import 'package:xiaomi/app/services/keep_alive_wrapper.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            ListView.builder(
                itemCount: 20,
                controller: controller.scrollController,
                itemBuilder: (context,index){
                  if(index==0){
                    return SizedBox(
                      width: ScreenAdapter.width(1080),
                      height: ScreenAdapter.height(682),
                      child: Image.network("https://www.itying.com/images/focus/focus02.png",fit: BoxFit.fill,),
                    );
                  }else{
                    return ListTile(title: Text("第$index个item"),);
                  }

            }),
            Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Obx(() => AppBar(
                  //appBar透明
                  backgroundColor: controller.flag.value?Colors.white: Colors.transparent,
                  elevation: 0,
                  title: AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    width: controller.flag.value?ScreenAdapter.width(800):ScreenAdapter.width(620),
                    height: ScreenAdapter.height(96),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.search,color: Colors.grey[400],),
                              Text("手机",style: TextStyle(color: Colors.grey,fontSize: ScreenAdapter.fontSize(40)),),
                            ],
                          ),
                          Icon(Icons.settings_overscan,color: Colors.grey[400],)
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                  leadingWidth: controller.flag.value?0:ScreenAdapter.width(140),
                  leading: controller.flag.value?Container():IconButton(onPressed: (){},icon: const Icon(EchoFonts.xiaomi),),
                  actions: [
                    IconButton(onPressed: (){}, icon:  Icon(Icons.qr_code,color: controller.flag.value?Colors.black87:Colors.white,)),
                    IconButton(onPressed: (){}, icon:  Icon(Icons.message,color: controller.flag.value?Colors.black87:Colors.white,)),
                  ],
                )))
          ],
        ),
      ),
    );
  }
}
