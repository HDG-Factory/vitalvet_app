import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/blocs/title_bar/title_bar_bloc.dart';

import 'package:vitalvet_app/utils/globals.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({
    Key? key,
  }) : super(key: key);

  void _initState(context) {
    // Globals.saveBtnVisible = false;
    BlocProvider.of<TitleBarBloc>(context).add(const ChangeTitleBarEvent(onPressed: null));
  }

  @override
  Widget build(BuildContext context) {
    _initState(context);
    return const Center(child: Text('Error'));
  }
}
