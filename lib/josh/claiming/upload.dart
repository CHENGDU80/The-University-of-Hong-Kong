import 'package:chengdu80_prototype/color.dart';
import 'package:flutter/material.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

class UploadUI extends StatefulWidget {
  const UploadUI({super.key});

  @override
  State<UploadUI> createState() => _UploadUIState();
}

class _UploadUIState extends State<UploadUI> {
  bool dropping = false;
  List<String> files = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            files.length,
            (index) {
              return Container(
                width: 160,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(120),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        files[index],
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          files.remove(files[index]);
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        DropRegion(
          formats: Formats.standardFormats,
          hitTestBehavior: HitTestBehavior.opaque,
          onDropOver: (event) {
            // You can inspect local data here, as well as formats of each item.
            // However on certain platforms (mobile / web) the actual data is
            // only available when the drop is accepted (onPerformDrop).
            final item = event.session.items.first;
            if (item.localData is Map) {
              // This is a drag within the app and has custom local data set.
            }
            if (item.canProvide(Formats.plainText)) {
              // this item contains plain text.
            }
            // This drop region only supports copy operation.
            if (event.session.allowedOperations.contains(DropOperation.copy)) {
              return DropOperation.copy;
            } else {
              return DropOperation.none;
            }
          },
          onDropEnter: (event) {
            setState(() {
              dropping = true;
            });
          },
          onDropLeave: (event) {
            setState(() {
              dropping = false;
            });
          },
          onPerformDrop: (event) async {
            setState(() {
              dropping = false;
            });
            // Called when user dropped the item. You can now request the data.
            // Note that data must be requested before the performDrop callback
            // is over.
            for (final item in event.session.items) {
              // data reader is available now
              final reader = item.dataReader!;
              final fileName = await reader.getSuggestedName();
              if (fileName == null) continue;
              files.add(fileName);
            }
            setState(() {});
          },
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: MyColors.secondary),
                color: dropping ? Colors.black.withOpacity(0.1) : null,
              ),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      size: 36,
                      color: Colors.grey,
                    ),
                    Text(
                      'Drag and drop / Click to select',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
