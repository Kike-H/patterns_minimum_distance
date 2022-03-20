import 'package:flutter/material.dart';

import 'package:frontend/model/dropped_file.dart';

class DroppedFileWidget extends StatelessWidget {
  final DroppedFile? file;

  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buildIcon(), if (file != null) buildFileDetails(file!)]);

  Widget buildIcon() {
    if (file == null) return buildEmptyFile('No File');
    return const Icon(
      Icons.document_scanner,
      size: 130,
      color: Colors.blueGrey,
    );
  }

  Widget buildEmptyFile(String s) => buildDecoration(
          child: Container(
        width: 120,
        height: 120,
        color: Colors.black26,
        child: Center(
          child: Text(s, style: const TextStyle(color: Colors.black38, fontSize: 24)),
        ),
      ));

  Widget buildFileDetails(DroppedFile file) {
    const style = TextStyle(fontSize: 20);

    return Container(
      margin: const EdgeInsets.only(left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(file.name, style: style.copyWith(fontWeight: FontWeight.bold)),
          Text(file.size, style: style)
        ],
      ),
    );
  }

  Widget buildDecoration({required Widget child}) {
    return ClipRRect(borderRadius: BorderRadius.circular(12), child: child);
  }
}
