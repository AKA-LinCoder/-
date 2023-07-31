import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/cart_controller.dart';
import 'cart_item_num_view.dart';

/// FileName cart_item
///
/// @Author LinGuanYu
/// @Date 2023/7/31 14:12
///
/// @Description TODO

class CartItemView extends GetView<CartController> {
  const CartItemView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenAdapter.height(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black12,width: ScreenAdapter.width(2)))
      ),
      child: Row(
        children: [
          SizedBox(
            width: ScreenAdapter.width(100),
            child: Checkbox(activeColor: Colors.red,value: true, onChanged: (value){}),
          ),
          Container(
            padding: EdgeInsets.all(ScreenAdapter.height(24)),
            width: ScreenAdapter.width(260),
            child: Image.network("https://www.itying.com/images/shouji.png",fit: BoxFit.fill,),
          ),
          SizedBox(width: ScreenAdapter.width(20),),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("小米11",style: TextStyle(fontSize: ScreenAdapter.fontSize(36),fontWeight: FontWeight.bold),),
                SizedBox(height: ScreenAdapter.height(20),),
                const Row(
                  children: [
                    Chip(label:  Text("黑色"),)
                  ],
                ),
                SizedBox(height: ScreenAdapter.height(20),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("¥98.9",style: TextStyle(fontSize: ScreenAdapter.fontSize(38),color: Colors.red),),
                    const CartItemNumView()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}