import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/screen_adapter.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchPageController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Container(
          width: ScreenAdapter.width(800),
          height: ScreenAdapter.height(96),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: TextField(
            autofocus: true,

            ///修改框框的字体大小
            style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "搜索",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(36)),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "搜索历史",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(43)),
              ),
              const Icon(Icons.delete)
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("红米"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机壳"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机"),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "猜你想搜",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenAdapter.fontSize(43)),
              ),
              const Icon(Icons.refresh)
            ],
          ),
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("红米"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机壳"),
              ),
              Container(
                padding: EdgeInsets.all(ScreenAdapter.width(16)),
                margin: EdgeInsets.all(ScreenAdapter.width(16)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Text("手机"),
              )
            ],
          ),
          //热销商品
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.height(138),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/hot_search.png"),
                          fit: BoxFit.cover)),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: GridView.builder(
                      itemCount: 8,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: ScreenAdapter.width(40),
                          mainAxisSpacing: ScreenAdapter.height(20),
                          childAspectRatio: 3 / 1),
                      itemBuilder: (context, index) {
                        return Container(
                            // color: Colors.white,

                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(ScreenAdapter.width(10)),
                                  alignment: Alignment.center,
                                  width: ScreenAdapter.width(120),
                                  child: Image.network("https://www.itying.com/images/shouji.png"),
                                ),
                                Expanded(child: Padding(
                                  padding:  EdgeInsets.all(ScreenAdapter.width(10)),
                                  child: Text("小米热水器"),
                                )),
                              ],
                            ));
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
