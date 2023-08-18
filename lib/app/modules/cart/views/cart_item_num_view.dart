import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaomi/app/services/screen_adapter.dart';

import '../controllers/cart_controller.dart';

/// FileName cart_item_num_view
///
/// @Author LinGuanYu
/// @Date 2023/7/31 14:31
///
/// @Description TODO

class CartItemNumView extends GetView<CartController> {
  final Map cartItem;
  CartItemNumView(this.cartItem, {Key? key}) :super (key: key);


  @override
  final CartController controller = Get.find();

  Widget _left(){
    return InkWell(
      onTap: ()async{
        await controller.decCartNum(cartItem);
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(60),
        child: const Text("-"),
      ),
    );
  }

  Widget _center(){
    return Container(
      alignment: Alignment.center,
      width: ScreenAdapter.width(80),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: ScreenAdapter.width(2),color: Colors.black12),
            right: BorderSide(width: ScreenAdapter.width(2),color: Colors.black12),
          )
      ),
      child:  Text(cartItem["count"].toString()),
    );
  }

  Widget _right(){
    return InkWell(
      onTap: ()async{
        await controller.incCartNum(cartItem);
      },
      child: Container(
        alignment: Alignment.center,
        width: ScreenAdapter.width(80),
        height: ScreenAdapter.height(60),
        child: const Text("+"),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(244),
      height: ScreenAdapter.height(60),
      decoration: BoxDecoration(
        border: Border.all(width: ScreenAdapter.width(2),color: Colors.black12)
      ),
      child: Row(
        children: [
          _left(),
          _center(),
          _right(),
        ],
      ),
    );
  }
}