import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:frontend/model/dropped_file.dart';

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<DroppedFile> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile}) : super(key: key);

  @override
  State<DropZoneWidget> createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    final colorButton = isHighlighted ? Colors.yellow.shade100 : Colors.blueGrey.shade200;
    return buildDecoration(
      child: Stack(children: [
        DropzoneView(
          onCreated: (controller) => this.controller = controller,
          onDrop: acceptFile,
          onHover: () => setState(() => isHighlighted = true),
          onLeave: () => setState(() => isHighlighted = true),
        ),
        Center(
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
                    final events = await controller.pickFiles();
                    if (events.isEmpty) return;
                    acceptFile(events.first);
                  },
                  icon: const Icon(Icons.search, size: 32),
                  label: const Text("Choose file",
                      style: TextStyle(color: Colors.black38, fontSize: 24)))
            ],
          ),
        )
      ]),
    );
  }

  Future acceptFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final bytes = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    if (kDebugMode) {
      print('Name $name');
      print('Type $mime');
      print('Bytes $bytes');
      print('Url $url');
    }

    final droppedFile = DroppedFile(
      url: url,
      name: name,
      type: mime,
      bytes: bytes,
    );

    widget.onDroppedFile(droppedFile);
    setState(() => isHighlighted = false);
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground =
        isHighlighted ? Colors.yellow.shade300 : const Color.fromRGBO(230, 233, 228, 1);

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
