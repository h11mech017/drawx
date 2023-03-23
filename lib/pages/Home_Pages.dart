import 'package:flutter/material.dart';
import 'package:drawx/pages/Component/urls.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _tappedNum = 0;
  static final List<Widget> _widgetOption = <Widget>[
    const DrawLiveWidget(),
    const ListPages(),
    const EditPages()
  ];

  void onItemTapped(int tapped) {
    setState(() {
      _tappedNum = tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DrawX_",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DrawX_"),
        ),
        body: Center(
          child: Column(
            children: [
              _widgetOption[_tappedNum],
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tappedNum,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black12,
          type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home_filled),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_circle_outlined),
                activeIcon: Icon(Icons.playlist_add_circle),
                label: "List"),
            BottomNavigationBarItem(
                icon: Icon(Icons.mode_edit_outline_outlined),
                activeIcon: Icon(Icons.mode_edit_outline),
                label: "Edit")
          ],
        ),
      ),
    );
  }
}
