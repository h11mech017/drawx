// pages/Component/urls.dart
import 'package:flutter/material.dart';

class ListPages extends StatelessWidget {
  final List<String> results; // Add a results parameter

  const ListPages({Key? key, required this.results}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(results[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Remove the result from the list and update the UI
              },
            ),
          );
        },
      ),
    );
  }
}

