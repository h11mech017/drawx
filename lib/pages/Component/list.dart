// pages/Component/urls.dart
import 'package:flutter/material.dart';

class ListPages extends StatefulWidget {
  final List<String> results; // Add a results parameter

  const ListPages({Key? key, required this.results}) : super(key: key);

  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages>{
    List<String> _results = [];

    @override
    void initState(){
      super.initState();
      _results = widget.results;
    }

    void _removeResult(int index){
      setState((){
        _results.removeAt(index);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_results[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                _removeResult(index);// Remove the result from the list and update the UI
              },
            ),
          );
        },
      ),
    );
  }
}

