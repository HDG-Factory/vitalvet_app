import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vitalvet_app/blocs/side_bar/side_bar_bloc.dart';

import 'icon_bar_btn.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool extended = false;
  bool mouseEntered = true;

  @override
  Widget build(BuildContext context) {
    final sideBarBloc = context.read<SideBarBloc>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SideBarBloc, SideBarState>(
        builder: (context, state) {
          state = (state as SideBarSelection);

          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  mouseEntered = true;
                });
              },
              onExit: (event) {
                setState(() {
                  mouseEntered = false;
                });
              },
              child: NavigationRail(
                selectedIndex: state.index,
                onDestinationSelected: (int index) =>
                    sideBarBloc.add(ChangeSideBarSelectionEvent(index)),
                extended: extended,
                labelType: NavigationRailLabelType.none,
                useIndicator: true,
                indicatorColor: Colors.white,
                leading: IconBarBtn(
                  iconBar: !mouseEntered || extended
                      ? SvgPicture.asset(
                          'assets/vitalvet_icon.svg',
                          width: 30,
                          height: 30,
                        )
                      : const Icon(
                          Icons.keyboard_double_arrow_right,
                        ),
                  onPressed: () {
                    setState(() {
                      extended = !extended;
                    });
                  },
                ),
                destinations: _destinations,
              ),
            ),
          );
        },
      ),
    );
  }

  List<NavigationRailDestination> get _destinations {
    return <NavigationRailDestination>[
      const NavigationRailDestination(
        icon: Icon(Icons.cruelty_free),
        label: Text('Mascotas'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.description_outlined),
        label: Text('Historias clínicas'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.calendar_month),
        label: Text('Calendario'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.person_outlined),
        label: Text('Perfil'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.notifications_outlined),
        label: Text('Notificaciones'),
      ),
      const NavigationRailDestination(
        icon: Icon(Icons.settings_outlined),
        label: Text('Configuración'),
      ),
    ];
  }
}
