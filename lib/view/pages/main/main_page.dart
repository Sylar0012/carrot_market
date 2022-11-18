import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                label: "홈", icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(
                label: "채팅", icon: Icon(CupertinoIcons.chat_bubble)),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            Container(
              color: Colors.orange[100],
              child: Center(
                child: Text(
                  "0번 인덱스",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.orange[200],
              child: Center(
                child: Text(
                  "1번 인덱스",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
