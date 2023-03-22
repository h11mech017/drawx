
import 'package:flutter/material.dart';
import 'package:drawx/pages/Draw_Live_Chart.dart';

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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("DrawX_"),),
        body: Center(
          child: Column(
            children: const [
              DrawLiveWidget(),
              // or put Buttons in bottom.
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit")
          ],
        ),
      ),
    );
  }
}

class DrawLiveWidget extends StatefulWidget {
  const DrawLiveWidget({super.key});


  @override
  _DrawLiveWidgetState createState() => _DrawLiveWidgetState();
}

class _DrawLiveWidgetState extends State<DrawLiveWidget> {

  List<double> prob = [];
  List<String> options = [];
  final TextEditingController _controller = TextEditingController();

  void _calculateProb() {
    prob.add(1.0);
    for(int i = 0; i < options.length; i++) {
      prob[i] = (1 / options.length) * 100.0;
    }
  }

  void _checkEmptyElement() {
    if (options.contains("")) {
      prob.remove(prob[0]);
      options.removeWhere( (item) => item.isEmpty );
    }
    _calculateProb();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(prob.isNotEmpty && options.isNotEmpty)
          Container(
            margin: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(180),
            ),
            child: SizedBox(
              height: 285,
              width: 285,
              child: LivePieChart(data: prob, labels: options),
            ),
          ),
        SizedBox(
          width: 450,
          height: 60,
          child: TextField(
            obscureText: false,
            controller: _controller,
            onSubmitted: (value) {
              setState(() {
                options.add(_controller.text);
                _checkEmptyElement();
                _controller.clear();
              });
            },
            decoration: InputDecoration(
              suffix: TextButton(
                onPressed: () {
                  setState(() {
                    options.add(_controller.text);
                    _checkEmptyElement();
                    _controller.clear();
                  });
                },
                child: const Text('Add'),
              ),
              border: const OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
        ),
      ],
    );
  }
}
