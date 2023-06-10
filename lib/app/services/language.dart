import 'package:get/get.dart';

/// FileName language
///
/// @Author LinGuanYu
/// @Date 2023/6/10 16:17
///
/// @Description TODO 语言包

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'zh_CN':{
      'hello':'你好',
      'title':'标题',
      'home':"首页",
      'category':'分类',
      'service':'服务',
      'cart':'购物车',
      'user':'用户'
    },
    'en_US':{
      'hello':'hello',
      'title':'title',
      'home':"home",
      'category':'category',
      'service':'service',
      'cart':'cart',
      'user':'user'
    }
  };

}