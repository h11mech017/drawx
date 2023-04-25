// pages/Component/Draw_Live_Chart.dart
import 'package:flutter/material.dart';
import 'urls.dart';


class DrawLiveWidget extends StatefulWidget {
  const DrawLiveWidget({super.key});

  @override
  _DrawLiveWidgetState createState() => _DrawLiveWidgetState();
}

class _DrawLiveWidgetState extends State<DrawLiveWidget> {
  List<double> prob = [];
  List<String> options = [];
  String _latestResult = "";
  final TextEditingController _nameController = TextEditingController();

  bool _showWheel = false;
  List<String> _results = []; // Add a list to store the results

  void _addOption() {
    setState(() {
      if (_nameController.text.isNotEmpty) {
        options.add(_nameController.text);
        prob.add(0.17);
        for (int i = 0; i<prob.length; i++) {
          prob[i] = 1 / prob.length;
        }
        _nameController.clear();
      }
    });

    if (options.isNotEmpty) {
      setState(() {
        _showWheel = true;
      });
    }else {
      setState(() {
        _showWheel = false;
      });
    }
  }

  void _openEditWheelOfFortune() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditWheelOfFortune(options: options, probabilities: prob)),
    );

    if (options.isEmpty) {
      setState(() {
        _showWheel = false;
      });
    } else {
      setState(() {
        _showWheel = true;
      });
    }
  }
  // Add a method to handle the result
  void _onResult(String result) {
    setState(() {
      if (!_results.contains(result)) {
        _results.add(result);
      }
      _latestResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showWheel) ...[
              Container(
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  // Add the _onResult callback to the WheelOfFortune
                  child: WheelOfFortune(
                      items: options, probabilities: prob, onResult: _onResult),
                ),
              ),
              Text(
                'Result: $_latestResult', // Display the latest result
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
            ] else
              const SizedBox(height: 300), // Add a placeholder when the wheel is not shown
            SizedBox(
              width: 450,
              height: 60,
              child: TextField(
                obscureText: false,
                controller: _nameController,
                onSubmitted: (_) => _addOption(),
                decoration: InputDecoration(
                  suffix: TextButton(
                    onPressed: _addOption,
                    child: const Text('Add'),
                  ),
                  border: OutlineInputBorder(),
                  labelText: "Add Options",
                ),
              ),
            ),
            // SizedBox(
            //   width: 450,
            //   height: 60,
            //   child: TextField(
            //     obscureText: false,
            //     controller: _probController,
            //     keyboardType: TextInputType.number,
            //     onSubmitted: (_) => _addOption(),
            //     decoration: InputDecoration(
            //       suffix: TextButton(
            //         onPressed: _addOption,
            //         child: const Text('Add'),
            //       ),
            //       //border: const OutlineInputBorder(),
            //       //labelText: "Probability",
            //     ),
            //   ),
            // ),
            TextButton(
              onPressed: _openEditWheelOfFortune,
              child: const Text('Edit Options'), // Add a button to open the EditWheelOfFortune page
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListPages(results: _results),
                  ),
                );
              },
              child: const Text('Show Results'),
            ),
          ],
        )
    );
  }
}
