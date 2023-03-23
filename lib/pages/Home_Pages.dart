import 'package:flutter/material.dart';
import 'package:drawx/pages/Component/urls.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  static final List<Widget> _widgetOption = <Widget>[
    const DrawLiveWidget(),


  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DrawX_",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("DrawX_"),),
        body: Center(
          child: Column(
            children: [
              _widgetOption[0],
            ],
          ),
        ),
        bottomNavigationBar: const btmNavigateBar(),
      ),
    );
  }
}