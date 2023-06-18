import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/pcontent_model.dart';
import '../../../services/cart_services.dart';
import '../../../services/https_client.dart';
import '../../../services/storage.dart';
import '../../../services/user_services.dart';

class ProductContentController extends GetxController {
  //TODO: Implement ProductContentController


  //顶部tab切换
  List tabsList = [
    {
      "id": 1,
      "title": "商品",
    },
    {"id": 2, "title": "详情"},
    {"id": 3, "title": "推荐"}
  ];

  //详情数据
  var pcontent = PcontentItemModel().obs;
  RxInt selectedTabsIndex = 1.obs;
  //attr属性筛选
  RxList<PcontentAttrModel> pcontentAttr = <PcontentAttrModel>[].obs;
  RxDouble opacity = 0.0.obs;
  //是否显示顶部tabs
  RxBool showTabs = false.obs;
  //保存筛选属性值
  RxString selectedAttr = "".obs;
  ScrollController scrollController = ScrollController();
  HttpsClient httpsClient = HttpsClient();
  GlobalKey gk1 = GlobalKey();
  GlobalKey gk2 = GlobalKey();
  GlobalKey gk3 = GlobalKey();
  //详情container的位置
  double gk2Position = 0;
  double gk3Position = 0;

  //购买的数量
  RxInt buyNum = 1.obs;



  @override
  void onInit() {
    super.onInit();
    getContentData();
    scrollController.addListener(() {
      if(scrollController.position.pixels<=100&&scrollController.position.pixels>=0){
        opacity.value = scrollController.position.pixels/100;
        if(showTabs.value){
          showTabs.value = false;
        }
      }else{
        if(!showTabs.value&&scrollController.position.pixels>=0){
            showTabs.value = true;
        }
      }
      update();
    });
  }


  //获取详情数据
  getContentData() async {
    var response =
    await httpsClient.get("api/pcontent?id=${Get.arguments["id"]}");
    // await httpsClient.get("api/pcontent?id=6333cc2d9e8e3a0f80512495");
    if (response != null) {
      print(response.data);
      var tempData = PcontentModel.fromJson(response.data);
      pcontent.value = tempData.result!;
      pcontentAttr.value = pcontent.value.attr!;
      initAttr(pcontentAttr); //初始化attr
      setSelectedAttr(); //获取商品属性
      update();
    }
  }

  //初始化attr
  initAttr(List<PcontentAttrModel> attr) {
    for (var i = 0; i < attr.length; i++) {
      for (var j = 0; j < attr[i].list!.length; j++) {
        if (j == 0) {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": true});
        } else {
          attr[i].attrList!.add({"title": attr[i].list![j], "checked": false});
        }
      }
    }
  }


  //改变attr cate  颜色    title 玫瑰红
  changeAttr(cate, title) {
    for (var i = 0; i < pcontentAttr.length; i++) {
      if (pcontentAttr[i].cate == cate) {
        for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
          pcontentAttr[i].attrList![j]["checked"] = false;
          if (pcontentAttr[i].attrList![j]["title"] == title) {
            pcontentAttr[i].attrList![j]["checked"] = true;
          }
        }
      }
    }
    update();
  }

  //获取attr属性
  setSelectedAttr() {
    List tempList = [];
    for (var i = 0; i < pcontentAttr.length; i++) {
      for (var j = 0; j < pcontentAttr[i].attrList!.length; j++) {
        if (pcontentAttr[i].attrList![j]["checked"]) {
          tempList.add(pcontentAttr[i].attrList![j]["title"]);
        }
      }
    }
    selectedAttr.value = tempList.join(",");
    update();
  }

  //增加数量
  incBuyNum() {
    buyNum.value++;
    update();
  }
  //减少数量

  decBuyNum() {
    if (buyNum.value > 1) {
      buyNum.value--;
      update();
    }
  }

  //加入购物车
  void addCart() {
    setSelectedAttr();
    CartServices.addCart(pcontent.value, selectedAttr.value, buyNum.value);
    Get.back();
    Get.snackbar("提示?", "加入购物车成功");
  }

  //立即购买
  void buy() async {
    setSelectedAttr();
    Get.back();
    bool loginState = await isLogin();
    if (loginState) {
      //保存商品信息
      List tempList = [];
      tempList.add({
        "_id": pcontent.value.sId,
        "title": pcontent.value.title,
        "price": pcontent.value.price,
        "selectedAttr": selectedAttr.value,
        "count": buyNum.value,
        "pic": pcontent.value.pic,
        "checked": true
      });
      Storage.setData("checkoutList", tempList);
      //执行跳转
      Get.toNamed("/checkout");
    } else {
      //执行跳转
      Get.toNamed("/code-login-step-one");
      Get.snackbar("提示信息!", "您还有没有登录，请先登录");
    }
  }

  //判断用户有没有登录
  Future<bool> isLogin() async {
    return await UserServices.getUserLoginState();
  }

//判断用户有没有登录

//获取要结算的商品

}
