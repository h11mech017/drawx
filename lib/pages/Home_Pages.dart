// pages/Home_Pages.dart
import 'package:flutter/material.dart';
import 'package:drawx/pages/Component/urls.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _tappedNum = 0;
  List<String> _results = []; // Add this line to store results

  void onItemTapped(int tapped) {
    setState(() {
      _tappedNum = tapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Move the _widgetOption definition inside the build method
    final List<Widget> _widgetOption = <Widget>[
      const DrawLiveWidget(),
      ListPages(results: _results), // Update this line
      const EditPages()
    ];

    return MaterialApp(
      title: "DrawX_",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DrawX_"),
        ),
        body: IndexedStack(
          index: _tappedNum,
          children: _widgetOption,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _tappedNum,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black12,
          type: BottomNavigationBarType.fixed,
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



