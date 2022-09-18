import 'package:flutter/material.dart';

class ListViewer extends StatelessWidget {
  final void Function(dynamic)? onItemTap;
  final List<dynamic> items;

  /// Function that returns a ListTile and requires two parameters:
  /// - [item] of type [dynamic]
  /// - [onTap] of type [VoidCallback]
  final Function tileTemplate;
  final ListTile? header;

  const ListViewer({Key? key, this.onItemTap, required this.items, required this.tileTemplate, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) {
          if (i == 0 && header != null) {
            return header!;
          }
          return tileTemplate(items[i], onItemTap);
        },
      ),
    );
  }
}
