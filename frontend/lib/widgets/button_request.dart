import 'package:flutter/material.dart';
import 'package:frontend/model/dropped_file.dart';

class ButtonRequest extends StatelessWidget {
  final DroppedFile? file;
  const ButtonRequest({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buttonDecorated();
  }

  Widget buttonDecorated() {
    final functionButton = file != null ? () {} : null;
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        ),
        onPressed: functionButton,
        icon: const Icon(Icons.send_rounded),
        label: const Text("Send"));
  }
}
