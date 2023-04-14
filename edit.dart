import 'package:flutter/material.dart';

class EditPages extends StatelessWidget {
  const EditPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("EditPages"),);
  }
}

//to show the edited goods and properity
class EditWheelOfFortune extends StatefulWidget {
  final List<String> options;
  final List<double> probabilities;

  EditWheelOfFortune({required this.options, required this.probabilities});

  @override
  _EditWheelOfFortuneState createState() => _EditWheelOfFortuneState();
}

class _EditWheelOfFortuneState extends State<EditWheelOfFortune> {
  void _addOption(String name, double probability) {
    setState(() {
      widget.options.add(name);
      widget.probabilities.add(probability);
    });
  }

  void _deleteOption(int index) {
    setState(() {
      widget.options.removeAt(index);
      widget.probabilities.removeAt(index);
    });
  }

  void _editOption(int index, String newName, double newProbability) {
    setState(() {
      widget.options[index] = newName;
      widget.probabilities[index] = newProbability;
    });
  }

  Future<void> _showEditDialog(int index) async {
    final TextEditingController nameController = TextEditingController(text: widget.options[index]);
    final TextEditingController probController = TextEditingController(text: widget.probabilities[index].toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: probController,
                decoration: const InputDecoration(labelText: 'Probability'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                _editOption(index, nameController.text, double.tryParse(probController.text) ?? 1.0);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Wheel of Fortune')),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.options[index]),
            subtitle: Text('Probability: ${widget.probabilities[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditDialog(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteOption(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(widget.options.length);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
