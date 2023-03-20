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
              const Spacer(),
              DrawLiveWidget(),
              const Spacer(),

              //// or put Buttons in bottom.
              // Row(
              //   children: [
              //     TextButton(
              //       onPressed: () {  },
              //       child: const Text('Add'),
              //     ),
              //     const Spacer(),
              //     TextButton(
              //       onPressed: () {  },
              //       child: const Text('List'),
              //     ),
              //   ],
              // ),
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

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        if (prob.isNotEmpty && options.isNotEmpty)
          Container(
            height: 300,
            width: 300,
            child: LivePieChart(data: prob, labels: options),
          ),
        TextField(
          obscureText: false,
          controller: _controller,
          onSubmitted: (value) {
            setState(() {
              options.add(_controller.text);
              _calculateProb();
              _controller.clear();
            });
          },
          decoration: InputDecoration(
            suffix: TextButton(
              onPressed: () {
                setState(() {
                  options.add(_controller.text);
                  _calculateProb();
                  _controller.clear();
                });
              },
              child: const Text('Add'),
            ),
            border: const OutlineInputBorder(),
            labelText: "Name",
          ),
        ),
      ],
    );
  }
}
