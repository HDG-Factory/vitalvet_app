import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:vitalvet_app/utils/globals.dart';

class CustomTitleBar extends StatefulWidget with PreferredSizeWidget {
  const CustomTitleBar({Key? key}) : super(key: key);

  @override
  State<CustomTitleBar> createState() => _CustomTitleBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _CustomTitleBarState extends State<CustomTitleBar> {
  final String title = 'Vitalvet';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: SizedBox(
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: MoveWindow(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 70),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Visibility(
                          visible: Globals.saveBtnVisible,
                          child: ElevatedButton(
                            onPressed: Globals.onPressed ?? () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Guardar'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = 50;

    return Row(
      children: [
        SizedBox(
          width: height,
          height: height,
          child: MinimizeWindowButton(),
        ),
        SizedBox(
          width: height,
          height: height,
          child: appWindow.isMaximized
              ? RestoreWindowButton(onPressed: maximizeOrRestore)
              : MaximizeWindowButton(onPressed: maximizeOrRestore),
        ),
        SizedBox(
          width: height,
          height: height,
          child: CloseWindowButton(),
        ),
      ],
    );
  }
}
