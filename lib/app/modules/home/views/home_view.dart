import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:xiaomi/app/services/keep_alive_wrapper.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body:  Center(
          child: Column(
            children: [
              Container(
                color: Colors.red,
                width: 1080.w,
                height: 690.h,
              ),
               Text(
                '首页视图',
                style: TextStyle(fontSize: 40.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
