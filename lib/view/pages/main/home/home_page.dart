import 'package:carrot_market/models/product.dart';
import 'package:carrot_market/view/pages/main/home/components/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.separated(
        itemCount: productList.length,
        itemBuilder: (context, index) => ProductItem(productList[index]),
        separatorBuilder: (context, index) => Divider(
          indent: 16, // 시작점 ( 앞에 공간 생김 )
          endIndent: 16, // 끝점 ( 뒤에 공간 생김 )
          color: Colors.grey,
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        Text("좌동"),
        SizedBox(
          width: 4,
        ),
        Icon(
          CupertinoIcons.chevron_down,
          size: 15,
        ),
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.list_dash)),
      IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.bell)),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(0.5),
      child: Divider(
        thickness: 1,
        height: 1,
        color: Colors.grey,
      ),
    ),
  );
}
