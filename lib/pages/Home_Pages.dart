import 'package:flutter/material.dart';
class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DrawX_",
      home: Scaffold(
        appBar: AppBar(title: const Text("DrawX_"),),
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              const Draw(),
              const Spacer(),
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {  },
                    child: const Text('Add'),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {  },
                    child: const Text('List'),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class Draw extends StatelessWidget {
  const Draw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      // color: Colors.brown,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: Colors.blue[100]
      ),

      child: TextButton(
        onPressed: () {  },
        child: const Text("Roll!"),
      ),
    );
  }
}

