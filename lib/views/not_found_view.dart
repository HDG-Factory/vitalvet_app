import 'package:flutter/material.dart';

import '../utils/globals.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({
    Key? key,
  }) : super(key: key);

  void _initState(context) {
    Globals.saveBtnVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return const Center(child: Text('Error'));
  }
}
