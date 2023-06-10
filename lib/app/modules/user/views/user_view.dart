import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('user'.tr),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            if(Get.locale==const Locale('zh','CN')){
              Get.updateLocale(const Locale('en','US'));
            }else if(Get.locale==const Locale('en','US')){
              Get.updateLocale(const Locale('zh','CN'));
            }
          }, icon: const Icon(Icons.language))
        ],
      ),
      body: const Center(
        child: Text(
          'UserView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
