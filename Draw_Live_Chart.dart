import 'package:flutter/material.dart';
import 'package:drawx/pages/Component/wheel_of_fortune.dart';
import 'package:drawx/pages/Component/edit.dart'; // Import the EditWheelOfFortune component

class DrawLiveWidget extends StatefulWidget {
  const DrawLiveWidget({super.key});

  @override
  _DrawLiveWidgetState createState() => _DrawLiveWidgetState();
}

class _DrawLiveWidgetState extends State<DrawLiveWidget> {
  List<double> prob = [];
  List<String> options = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _probController = TextEditingController();

  bool _showWheel = false;

  void _addOption() {
    setState(() {
      if (_nameController.text.isNotEmpty && _probController.text.isNotEmpty) {
        options.add(_nameController.text);
        prob.add(double.tryParse(_probController.text) ?? 1.0);
        _nameController.clear();
        _probController.clear();
      }
    });

    if (options.isNotEmpty) {
      setState(() {
        _showWheel = true;
      });
    }
  }

  void _openEditWheelOfFortune() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditWheelOfFortune(options: options, probabilities: prob)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showWheel)
              Container(
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: WheelOfFortune(items: options, probabilities: prob),
                ),
              ),
            SizedBox(
              width: 450,
              height: 60,
              child: TextField(
                obscureText: false,
                controller: _nameController,
                onSubmitted: (_) => _addOption(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name",
                ),
              ),
            ),
            SizedBox(
              width: 450,
              height: 60,
              child: TextField(
                obscureText: false,
                controller: _probController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _addOption(),
                decoration: InputDecoration(
                  suffix: TextButton(
                    onPressed: _addOption,
                    child: const Text('Add'),
                  ),
                  border: const OutlineInputBorder(),
                  labelText: "Probability",
                ),
              ),
            ),
            TextButton(
              onPressed: _openEditWheelOfFortune,
              child: const Text('Edit Options'), // Add a button to open the EditWheelOfFortune page
            ),
          ],
        )
    );
  }
}
