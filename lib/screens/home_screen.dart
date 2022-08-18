import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/views/pets_view.dart';
import 'package:vitalvet_app/widgets/side_bar.dart';

import '../blocs/side_bar/side_bar_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Row(
      children: <Widget>[
        const SideBar(),
        _viewContent(),
      ],
    );
  }

  Widget _viewContent() {
    return Expanded(
      child: BlocBuilder<SideBarBloc, SideBarState>(
        builder: (context, state) {
          state = (state as SideBarSelection);

          switch (state.index) {
            case 0:
              return PetsView();
            default:
              return PetsView();
          }
        },
      ),
    );
  }
}
