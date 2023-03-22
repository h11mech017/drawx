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
      home: Scaffold(
        appBar: AppBar(title: const Text("DrawX_"),),
        body: Center(
          child: Column(
            children: [
              DrawLiveWidget(),
              // or put Buttons in bottom.

              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class DrawLiveWidget extends StatefulWidget {

  @override
  _DrawLiveWidgetState createState() => _DrawLiveWidgetState();
}

class _DrawLiveWidgetState extends State<DrawLiveWidget> {

  List<double> prob = [];
  List<String> options = [];
  TextEditingController _controller = TextEditingController();

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
          SizedBox(
            height: 285,
            width: 285,
            child: LivePieChart(data: prob, labels: options),
          ),
        TextField(
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
        Row(
          children: [
            TextButton(
              onPressed: () {  },
              child: const Text('Roll!'),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {  },
              child: const Text('List'),
            ),
          ],
        ),
      ],
    );
  }
}
