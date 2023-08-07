import 'package:get/get.dart';
import 'package:xiaomi/app/services/cart_services.dart';

class CartController extends GetxController {
  //TODO: Implement CartController

  RxList cartList = [].obs;
  @override
  void onInit() {
    super.onInit();
    getCartListData();
  }


  getCartListData()async{
    var tempList =  await CartServices.getCartList();
    cartList.value = tempList;
    update();

  }

  @override
  void onClose() {
    super.onClose();
  }

}
