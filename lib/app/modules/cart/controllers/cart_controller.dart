import 'package:get/get.dart';
import 'package:xiaomi/app/services/cart_services.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cartList = [].obs;
  @override
  void onInit() {
    super.onInit();
  }

  getCartListData() async {
    var tempList = await CartServices.getCartList();
    cartList.value = tempList;
    update();
  }





  @override
  void onClose() {
    super.onClose();
  }

  //增加数量
  incCartNum(Map cartItem) async{
    var temp = [];
    for(var cart in cartList){
      if(cart["_id"] == cartItem["_id"]&&cart["selectedAttr"] == cartItem["selectedAttr"]){
         cart["count"]++;
      }
      temp.add(cart);
    }
    cartList.value = temp;
    await CartServices.setCartList(cartList);
    update();

  }
  //减少数量
  decCartNum(Map cartItem) async{
    var temp = [];
    for(var cart in cartList){
      if(cart["_id"] == cartItem["_id"]&&cart["selectedAttr"] == cartItem["selectedAttr"]){
        if(cart["count"]>1){
          cart["count"]--;
        }else{
          Get.snackbar("提示","购物车数量已经到最小了");
        }
      }
      temp.add(cart);
    }
    cartList.value = temp;
    await CartServices.setCartList(cartList);
    update();
  }

  //checkbox选中
  checkCartItem(Map cartItem) async{
    var temp = [];
    for(var cart in cartList){
      if(cart["_id"] == cartItem["_id"]&&cart["selectedAttr"] == cartItem["selectedAttr"]){
        cart["checked"] = !cart["checked"];
      }
      temp.add(cart);
    }
    cartList.value = temp;
    await CartServices.setCartList(cartList);
    update();

  }





}
