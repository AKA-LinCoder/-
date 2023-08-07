import 'package:get/get.dart';
import 'package:xiaomi/app/services/search_services.dart';

import '../../../services/storage.dart';

class SearchPageController extends GetxController {
  //TODO: Implement SearchController

  String keywords = "";
  RxList historyList = [].obs;

  @override
  void onInit() {
    super.onInit();
    getHistoryData();
  }


  getHistoryData()async{
    var tempList  = await SearchServices.getHistoryData();
    if(tempList.isNotEmpty){
      historyList.addAll(tempList);
      //加上value 页面显示就会出现异常
      // historyList.value.addAll(tempList);
      update();
    }
  }

  clearHistoryData() async{
    await SearchServices.clearHistoryData();
    historyList.clear();
    update();
  }

  removeHistoryData(keywords) async{
    var tempList=await SearchServices.getHistoryData();
    if(tempList.isNotEmpty){
      tempList.remove(keywords);
      await Storage.setData("searchList", tempList);
      //注意
      historyList.remove(keywords);
      update();
    }
  }

}
