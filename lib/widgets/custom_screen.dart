import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import '../utils/screen_size.dart';
import 'custom_title_bar.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key, required this.body}) : super(key: key);
  final Widget body;

  @override
  Widget build(BuildContext context) {
    ScreenSize.recalculate(context);
    return WindowBorder(
      color: Colors.black,
      width: 1,
      child: Scaffold(
        appBar: const CustomTitleBar(),
        body: body,
      ),
    );
  }
}
