import 'dart:io';

import 'package:flutter/material.dart';
import 'package:frontend/model/dropped_file.dart';
import 'package:http/http.dart' as http;

class ButtonRequest extends StatelessWidget {
  final DroppedFile? file;
  const ButtonRequest({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonDecorated();
  }

  Widget buttonDecorated() {
    final functionButton = file != null ? _uploadFile : null;
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            primary: Colors.black45),
        onPressed: functionButton,
        icon: const Icon(Icons.send_rounded),
        label: const Text("Send"));
  }

  void _uploadFile() async {
    var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', file!.url));
    var res = await request.send();
    print(await res.stream.toList());
  }
}
