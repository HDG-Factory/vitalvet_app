import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/screen_size.dart';
import 'custom_title_bar.dart';

class CustomScreen extends StatelessWidget {
  final Widget body;
  final bool? isHomeRoute;

  const CustomScreen({Key? key, required this.body, this.isHomeRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.recalculate(context);
    return WindowBorder(
      color: Colors.black,
      width: 1,
      child: Scaffold(
        appBar: CustomTitleBar(
          isHomeRoute: isHomeRoute,
        ),
        body: body,
      ),
    );
  }
}
