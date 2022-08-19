import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vitalvet_app/views/pets_view.dart';
import 'package:vitalvet_app/widgets/side_bar.dart';

import '../blocs/side_bar/side_bar_bloc.dart';
import '../widgets/custom_screen.dart';
import '../widgets/custom_title_bar.dart';

class HomeScreen extends StatelessWidget {
  final Widget viewContent;

  const HomeScreen({super.key, required this.viewContent});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: const CustomTitleBar(
    //     title: 'Vitalvet',
    //   ),
    //   body: _body(context),
    // );
    return CustomScreen(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return Row(
      children: <Widget>[
        const SideBar(),
        viewContent,
      ],
    );
  }

  // Widget _viewContent() {
  //   return Expanded(
  //     child: BlocBuilder<SideBarBloc, SideBarState>(
  //       builder: (context, state) {
  //         state = (state as SideBarSelection);

  //         switch (state.index) {
  //           case 0:
  //             return PetsView();
  //           default:
  //             return PetsView();
  //         }
  //       },
  //     ),
  //   );
  // }
}
