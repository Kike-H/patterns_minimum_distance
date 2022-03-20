import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeus App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Zeus App Pattern'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
