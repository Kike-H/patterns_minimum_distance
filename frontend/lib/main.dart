import 'package:flutter/material.dart';
import 'package:frontend/widgets/dropped_file_widget.dart';
import 'package:frontend/widgets/dropzone_widget.dart';

import 'package:frontend/model/dropped_file.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DroppedFile? file;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeus App Calculator Patterns',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('⚡️️️'),
          backgroundColor: Colors.black87,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            DroppedFileWidget(file: file),
            const SizedBox(height: 12),
            SizedBox(height: 300, child: DropZoneWidget(onDroppedFile: (file) => setState(() => this.file = file)))
          ]),
        ),
      ),
    );
  }
}
