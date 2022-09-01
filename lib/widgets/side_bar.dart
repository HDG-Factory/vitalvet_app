import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vitalvet_app/blocs/side_bar/extension/side_bar_extension_bloc.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool mouseEntered = true;
  bool extended = false;

  @override
  Widget build(BuildContext context) {
    final sideBarExtensionBloc = context.read<SideBarExtensionBloc>();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocBuilder<SideBarExtensionBloc, bool>(
        builder: (context, bool isExtended) {
          extended = isExtended;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: !isExtended ? 90 : 235,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _appIconBtn(sideBarExtensionBloc, extended),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _getItems(topItems, 0, isExtended),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _getItems(bottomItems, 3, isExtended),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  MyNavigationRailFab _appIconBtn(sideBarExtensionBloc, bool extended) {
    return MyNavigationRailFab(
      icon: SizedBox(
        height: 30,
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) =>
                FadeTransition(opacity: anim, child: child),
            child: !mouseEntered
                ? SvgPicture.asset('assets/vitalvet_icon.svg',
                    height: 30, width: 30)
                : AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == const ValueKey('icon2')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: FadeTransition(opacity: anim, child: child)),
                    child: !extended
                        ? const Icon(Icons.keyboard_double_arrow_down,
                            key: ValueKey('icon2'))
                        : const Icon(Icons.keyboard_double_arrow_left,
                            key: ValueKey('icon3')),
                  )),
      ),
      text: 'Agregar',
      index: 500,
      onPressed: () {
        sideBarExtensionBloc.add(ChangeSideBarExtensionEvent(!extended));
      },
    );
  }

  List<Widget> _getItems(
      List<List<Object>> list, int startIndex, bool extended) {
    List<MyNavigationRailFab> items = [];

    for (int i = 0; i < list.length; i++) {
      int index = startIndex;
      items.add(MyNavigationRailFab(
        icon: list[i][0] as Widget,
        text: list[i][1] as String,
        index: index,
        extended: extended,
        // selected: currentIndex == index,
        onPressed: () {
          // GO TO ROUTE
        },
      ));
      startIndex++;
    }

    return items;
  }

  final topItems = [
    [
      const Icon(Icons.cruelty_free),
      'Mascotas',
    ],
    [
      const Icon(Icons.description_outlined),
      'Historias clínicas',
    ],
    [
      const Icon(Icons.calendar_month),
      'Calendario',
    ],
  ];

  final bottomItems = [
    [
      const Icon(Icons.person_outlined),
      'Perfil',
    ],
    [
      const Icon(Icons.notifications_outlined),
      'Notificaciones',
    ],
    [
      const Icon(Icons.settings_outlined),
      'Configuración',
    ],
  ];
}

class MyNavigationRailFab extends StatelessWidget {
  final bool? extended;
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final int? index;
  final bool? selected;

  const MyNavigationRailFab(
      {super.key,
      this.text,
      this.index,
      this.onPressed,
      this.icon,
      this.extended,
      this.selected});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color foregroundColor = const Color.fromARGB(255, 89, 93, 96);
    Color hoverColor = const Color.fromARGB(255, 246, 250, 254);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        hoverColor: hoverColor,
        splashColor: Colors.yellow,
        fillColor: (selected != null && selected == true) ? Colors.blue : null,
        focusColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: extended == null || extended == false
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: icon,
                ),
              )
            : Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: icon!,
                  ),
                  Text(
                    text!,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
      ),
    );
    // };
    // );
  }
}




// ---------------

// class ColorfulButton extends StatefulWidget {
//   const ColorfulButton({Key? key}) : super(key: key);

//   @override
//   State<ColorfulButton> createState() => _ColorfulButtonState();
// }

// class _ColorfulButtonState extends State<ColorfulButton> {
//   late FocusNode _node;
//   bool _focused = false;
//   late FocusAttachment _nodeAttachment;
//   Color _color = Colors.white;

//   @override
//   void initState() {
//     super.initState();
//     _node = FocusNode(debugLabel: 'Button');
//     _node.addListener(_handleFocusChange);
//     _nodeAttachment = _node.attach(context, onKey: _handleKeyPress);
//   }

//   void _handleFocusChange() {
//     if (_node.hasFocus != _focused) {
//       setState(() {
//         _focused = _node.hasFocus;
//       });
//     }
//   }

//   KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
//     if (event is RawKeyDownEvent) {
//       debugPrint(
//           'Focus node ${node.debugLabel} got key event: ${event.logicalKey}');
//       if (event.logicalKey == LogicalKeyboardKey.keyR) {
//         debugPrint('Changing color to red.');
//         setState(() {
//           _color = Colors.red;
//         });
//         return KeyEventResult.handled;
//       } else if (event.logicalKey == LogicalKeyboardKey.keyG) {
//         debugPrint('Changing color to green.');
//         setState(() {
//           _color = Colors.green;
//         });
//         return KeyEventResult.handled;
//       } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
//         debugPrint('Changing color to blue.');
//         setState(() {
//           _color = Colors.blue;
//         });
//         return KeyEventResult.handled;
//       }
//     }
//     return KeyEventResult.ignored;
//   }

//   @override
//   void dispose() {
//     _node.removeListener(_handleFocusChange);
//     // The attachment will automatically be detached in dispose().
//     _node.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _nodeAttachment.reparent();
//     return GestureDetector(
//       onTap: () {
//         if (_focused) {
//           _node.unfocus();
//         } else {
//           _node.requestFocus();
//         }
//       },
//       child: Center(
//         child: Container(
//           width: 400,
//           height: 100,
//           color: _focused ? _color : Colors.white,
//           alignment: Alignment.center,
//           child:
//               Text(_focused ? "I'm in color! Press R,G,B!" : 'Press to focus'),
//         ),
//       ),
//     );
//   }
// }

// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     return DefaultTextStyle(
//       style: textTheme.headline4!,
//       child: Column (
//         children: [
//             const ColorfulButton(),
//             const ColorfulButton(),
//           ]
//         )
//     );
//   }
// }