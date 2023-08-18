import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/modules/cart/views/cart_item.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView {

  //不使用依赖注入，手动获取controller
  @override
  CartController controller = Get.put(CartController());

  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('购物车'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [TextButton(onPressed: (){}, child: const Text("编辑"))],
      ),

      body:  GetBuilder<CartController>(
        initState: (state){
          ///使用GetBuilder，可以每次都刷新
          controller.getCartListData();
        },
        init: controller,
        builder: (controller){
          return controller.cartList.isNotEmpty?Stack(
            children: [
              ListView.builder(
                padding: EdgeInsets.only(bottom: ScreenAdapter.height(200)),
                itemCount: controller.cartList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartItemView(controller.cartList[index]);
                },),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: ScreenAdapter.width(20)),
                    width: ScreenAdapter.width(1080),
                    height: ScreenAdapter.height(190),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(color: Colors.black12,width: ScreenAdapter.height(2)))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                activeColor: Colors.red,
                                value: controller.isAllCheck.value, onChanged: (value)async{
                              await controller.checkAll(value);
                            }),
                            const Text("全选"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("合计: "),
                            Text("¥98.9",style: TextStyle(fontSize: ScreenAdapter.fontSize(58),color: Colors.red),),
                            SizedBox(width: ScreenAdapter.width(20),),
                            ElevatedButton(onPressed: (){},style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.orange),
                                foregroundColor: MaterialStateProperty.all(Colors.white)
                            ), child: const Text("结算"),)
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ):const Text('暂无数据');
        },
      )
    );
  }
}
