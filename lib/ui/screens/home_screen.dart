import 'package:flutter/material.dart';
import 'package:vitalvet_app/ui/widgets/side_bar.dart';

import '../widgets/templates/custom_screen.dart';

class HomeScreen extends StatelessWidget {
  final Widget viewContent;
  final String currentView;

  const HomeScreen({super.key, required this.viewContent, required this.currentView});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      body: _body(context),
      isHomeRoute: true,
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      children: <Widget>[
        SideBar(
          currentView: currentView,
        ),
        viewContent,
      ],
    );
  }
}
