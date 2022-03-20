import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/model/dropped_file.dart';
import 'package:http/http.dart' as http;

class ButtonRequest extends StatelessWidget {
  final DroppedFile? file;
  const ButtonRequest({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonDecorated(context);
  }

  Widget buttonDecorated(BuildContext context) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
            primary: Colors.black45),
        onPressed: file != null ? () => {_uploadFile(context)} : null,
        icon: const Icon(Icons.send_rounded),
        label: const Text("Send"));
  }

  void _uploadFile(BuildContext context) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://127.0.0.1:8000/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', file!.url));
    var res = await request.send();
    var result = json.decode(await res.stream.bytesToString())['resp'];

    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text("The result's ${file!.name}"),
              content: Text("The pattern class is: $result"),
            ));
  }
}
