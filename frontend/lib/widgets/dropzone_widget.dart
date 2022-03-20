import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cross_file/cross_file.dart';

import 'package:frontend/model/dropped_file.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile}) : super(key: key);

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  bool isHighlighted = false;
  final List<XFile> files = [];

  @override
  Widget build(BuildContext context) {
    final colorButton = isHighlighted ? Colors.yellow.shade100 : Colors.blueGrey.shade200;
    return buildDecoration(
      child: Stack(children: [
        DropTarget(
          onDragDone: acceptFile,
          onDragEntered: (url) => setState(() => isHighlighted = true),
          onDragExited: (url) => setState(() => isHighlighted = false),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cloud_upload_rounded, size: 80, color: Colors.blueGrey),
                const Text(
                  "Drop Excel Files Here",
                  style: TextStyle(color: Colors.black38, fontSize: 24),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                        primary: colorButton,
                        shape: const RoundedRectangleBorder()),
                    onPressed: () async {
                      // final events = await controller.pickFiles();
                      // if (events.isEmpty) return;
                      // acceptFile(events.first);
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                      color: Colors.black38,
                    ),
                    label: const Text("Choose file",
                        style: TextStyle(color: Colors.black38, fontSize: 24)))
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future acceptFile(DropDoneDetails urls) async {
    var droppedFile;
    for (final f in urls.files) {
      var size = await f.length();
      droppedFile = DroppedFile(url: f.path, name: f.name, type: "", bytes: size);
    }

    widget.onDroppedFile(droppedFile);
    setState(() => isHighlighted = false);
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground =
        isHighlighted ? Colors.yellow.shade200 : const Color.fromRGBO(230, 233, 228, 1);

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: colorBackground,
        padding: const EdgeInsets.all(10),
        child: DottedBorder(
            borderType: BorderType.RRect,
            color: Colors.black45,
            strokeWidth: 3,
            padding: EdgeInsets.zero,
            dashPattern: const [8, 4],
            radius: const Radius.circular(10),
            child: child),
      ),
    );
  }
}
