import 'package:dio/dio.dart';

class HttpsClient {
  static String domain = "https://xiaomi.itying.com/";
  static Dio dio = Dio();
  HttpsClient() {
    dio.options.baseUrl = domain;
    dio.options.connectTimeout = const Duration(milliseconds: 5000); //5s
    dio.options.receiveTimeout = const Duration(milliseconds: 5000); //5
  }

 Future get(apiUrl) async {   
    try {
      var response = await dio.get(apiUrl);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }
  Future post(String apiUrl,{Map? data}) async {   
    try {
      var response = await dio.post(apiUrl,data:data);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }

  static replaceUri(picUrl){
      String tempUrl=domain+picUrl;
      return tempUrl.replaceAll("\\", "/");
  }
}

